define pentaho::backend() {

	$instance = $name
	$dbtype = hiera('dbtype')
	$port = hiera('port')

	file {"/tmp/pentaho_${name}" : 
		ensure => directory,
	}


	if $dbtype == 'hsql' {


		$h = get_cwd_hash_path("${hsqldb_path}/${name}", $name)
		create_resources('file', $h, {'ensure'	=> 'directory', 'owner' => 'root', 'group' => 'root', 'mode' => '0755', require => File["/tmp/pentaho_${name}"]})

		file {"${hsqldb_path}/${name}" :
			ensure => directory,
			mode =>	'0777',
			recurse => true,
		}

		File{ ensure => present, replace => false, mode => '0777'}
		file{"${hsqldb_path}/${name}/hibernate${name}.properties" : 
			content => template('pentaho/hsqldb/hibernate.properties'),
		}
		file{"${hsqldb_path}/${name}/hibernate${name}.script" :
			content => template('pentaho/hsqldb/hibernate.script'),
	   	}
		file{"${hsqldb_path}/${name}/migration${name}.sql" : 
			content => template('pentaho/hsqldb/migration.sql'),
		}
		file{"${hsqldb_path}/${name}/quartz${name}.properties" : 
			content => template('pentaho/hsqldb/quartz.properties'),
		}
		file{"${hsqldb_path}/${name}/quartz${name}.script" : 
			content => template('pentaho/hsqldb/quartz.script'),
		}



	} else {

		$cmd = $dbtype ? {
			/(mysql|mysql5)/		=>	"mysql -u${user} -p${pass} -h${ip} ",
			'postgresql'			=>	"psql -U ${user} -W ${pass} -h ${ip} ",
			/(oracle|oracle10g)/	=>	undef,
			default					=>	undef,
		}

		$extra = $dbtype ? {
			/(mysql|mysql5)/		=>	"-e 'show databases'",
			'postgresql'			=>	"-l",
			/(oracle|oracle10g)/	=>	undef,
			default					=>	undef,
		}

		$exe_sql = $dbtype ? {
			/(mysql|mysql5)/		=>	"-e",
			'postgresql'			=>	"-c",
			/(oracle|oracle10g)/	=>	undef,
			default					=>	undef,
		}

		File { ensure => present,}
		file {"/tmp/pentaho_${name}/1_create_repository.sql" :
			content => template("pentaho/backend/${dbtype}/1_create_repository.sql"),
	   	}
		file {"/tmp/pentaho_${name}/2_create_quartz.sql" :
			content => template("pentaho/backend/${dbtype}/2_create_quartz.sql"),
			require => File["/tmp/pentaho_${name}/1_create_repository.sql"],
	   	}

		# TODO : Add a conditional if, to do the three following resource only if $add_sample is true
		file {"/tmp/pentaho_${name}/3_create_sample_datasource.sql" :
			content => template("pentaho/backend/${dbtype}/3_create_sample_datasource.sql"),
			require => File["/tmp/pentaho_${name}/2_create_quartz.sql"],
	   	}
		file {"/tmp/pentaho_${name}/4_load_sample_users.sql" :
			content => template("pentaho/backend/${dbtype}/4_load_sample_users.sql"),
			require => File["/tmp/pentaho_${name}/3_create_sample_datasource.sql"],
	   	}
		file {"/tmp/pentaho_${name}/5_sampledata.sql" :
			content => template("pentaho/backend/${dbtype}/5_sampledata.sql"),
			require => File["/tmp/pentaho_${name}/4_load_sample_users.sql"],
	   	}

		Exec{ path => ["/usr/bin", "/usr/sbin", "/bin"], cwd => "/tmp/pentaho_${name}/", }
		exec {"${name} ${cmd} < 1_create_repository.sql" :
			command => "${cmd} < 1_create_repository.sql",
			unless => "${cmd} ${extra} | grep hibernate${name}",
			require => File["/tmp/pentaho_${name}/1_create_repository.sql"],
		}
		exec {"${name} ${cmd} < 2_create_quartz.sql" :
			command => "${cmd} < 2_create_quartz.sql",
			unless => "${cmd} ${extra} | grep quartz${name}",
			require => [Exec["${name} ${cmd} < 1_create_repository.sql"],File["/tmp/pentaho_${name}/2_create_quartz.sql"]],
		}
		exec {"${name} ${cmd} < 3_create_sample_datasource.sql" :
			command => "${cmd} < 3_create_sample_datasource.sql",
			unless => "${cmd} hibernate${name} ${exe_sql} 'SELECT NAME FROM DATASOURCE' | grep SampleData",
			require => [Exec["${name} ${cmd} < 2_create_quartz.sql"],File["/tmp/pentaho_${name}/3_create_sample_datasource.sql"]],
		}
		exec {"${name} ${cmd} < 4_load_sample_users.sql" :
			command => "${cmd} < 4_load_sample_users.sql",
			unless => "${cmd} hibernate${name} ${exe_sql} 'SELECT USERNAME FROM USERS' | grep joe",
			require => [Exec["${name} ${cmd} < 3_create_sample_datasource.sql"],File["/tmp/pentaho_${name}/4_load_sample_users.sql"]],
		}
		exec {"${name} ${cmd} < 5_sampledata.sql" :
			command => "${cmd} < 5_sampledata.sql",
			unless => "${cmd} ${extra} | grep sampledata${name}",
			require => [Exec["${name} ${cmd} < 4_load_sample_users.sql"], File["/tmp/pentaho_${name}/5_sampledata.sql"]],
		}

	}
}
