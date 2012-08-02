define pentaho::backend($instance,
						$hsqldb_path,
						$dbtype,
						$host,
						$port,
						$version,
						$cmd,
						$exe_sql,
						) {

	file {"/tmp/pentaho_${instance}" : 
		ensure => directory,
	}

	if $dbtype == 'hsql' {

		$h = get_cwd_hash_path("${hsqldb_path}/${instance}", $instance)
		create_resources('file', $h, {'ensure'	=> 'directory', 'owner' => 'root', 'group' => 'root', 'mode' => '0755', require => File["/tmp/pentaho_${instance}"]})

		file {"${hsqldb_path}/${instance}" :
			ensure => directory,
			mode =>	'0777',
			recurse => true,
		}

		File{ ensure => present, replace => false, mode => '0777'}
		file{"${hsqldb_path}/${instance}/hibernate${instance}.properties" : 
			content => template('pentaho/hsqldb/hibernate.properties'),
		}
		file{"${hsqldb_path}/${instance}/hibernate${instance}.script" :
			content => template('pentaho/hsqldb/hibernate.script'),
	   	}
		file{"${hsqldb_path}/${instance}/migration${instance}.sql" : 
			content => template('pentaho/hsqldb/migration.sql'),
		}
		file{"${hsqldb_path}/${instance}/quartz${instance}.properties" : 
			content => template('pentaho/hsqldb/quartz.properties'),
		}
		file{"${hsqldb_path}/${instance}/quartz${instance}.script" : 
			content => template('pentaho/hsqldb/quartz.script'),
		}
		file{"${hsqldb_path}/${instance}/sampledata${instance}.properties" : 
			content => template('pentaho/hsqldb/sampledata.properties'),
		}
		file{"${hsqldb_path}/${instance}/sampledata${instance}.script" : 
			content => template('pentaho/hsqldb/sampledata.script'),
		}
	} else {

		$extra = $dbtype ? {
			/(mysql|mysql5)/		=>	"-e 'show databases'",
			'postgresql'			=>	"-l",
			/(oracle|oracle10g)/	=>	undef,
			default					=>	undef,
		}

		File { ensure => present,}
		file {"/tmp/pentaho_${instance}/1_create_repository.sql" :
			content => template("pentaho/backend/${dbtype}/1_create_repository.sql"),
	   	}
		file {"/tmp/pentaho_${instance}/2_create_quartz.sql" :
			content => template("pentaho/backend/${dbtype}/2_create_quartz.sql"),
			require => File["/tmp/pentaho_${instance}/1_create_repository.sql"],
	   	}

		# TODO : Add a conditional if, to do the three following resource only if $add_sample is true
		file {"/tmp/pentaho_${instance}/3_create_sample_datasource.sql" :
			content => template("pentaho/backend/${dbtype}/3_create_sample_datasource.sql"),
			require => File["/tmp/pentaho_${instance}/2_create_quartz.sql"],
	   	}
		file {"/tmp/pentaho_${instance}/4_load_sample_users.sql" :
			content => template("pentaho/backend/${dbtype}/4_load_sample_users.sql"),
			require => File["/tmp/pentaho_${instance}/3_create_sample_datasource.sql"],
	   	}
		file {"/tmp/pentaho_${instance}/5_sampledata.sql" :
			content => template("pentaho/backend/${dbtype}/5_sampledata.sql"),
			require => File["/tmp/pentaho_${instance}/4_load_sample_users.sql"],
	   	}

		Exec{ path => ["/usr/bin", "/usr/sbin", "/bin"], cwd => "/tmp/pentaho_${instance}/", }
		exec {"${instance} ${cmd} < 1_create_repository.sql" :
			command => "${cmd} < 1_create_repository.sql",
			unless => "${cmd} ${extra} | grep hibernate${instance}",
			require => File["/tmp/pentaho_${instance}/1_create_repository.sql"],
		}
		exec {"${instance} ${cmd} < 2_create_quartz.sql" :
			command => "${cmd} < 2_create_quartz.sql",
			unless => "${cmd} ${extra} | grep quartz${instance}",
			require => [Exec["${instance} ${cmd} < 1_create_repository.sql"],File["/tmp/pentaho_${instance}/2_create_quartz.sql"]],
		}
		exec {"${instance} ${cmd} < 3_create_sample_datasource.sql" :
			command => "${cmd} < 3_create_sample_datasource.sql",
			unless => "${cmd} hibernate${instance} ${exe_sql} 'SELECT NAME FROM DATASOURCE' | grep SampleData",
			require => [Exec["${instance} ${cmd} < 2_create_quartz.sql"],File["/tmp/pentaho_${instance}/3_create_sample_datasource.sql"]],
		}
		exec {"${instance} ${cmd} < 4_load_sample_users.sql" :
			command => "${cmd} < 4_load_sample_users.sql",
			unless => "${cmd} hibernate${instance} ${exe_sql} 'SELECT USERNAME FROM USERS' | grep joe",
			require => [Exec["${instance} ${cmd} < 3_create_sample_datasource.sql"],File["/tmp/pentaho_${instance}/4_load_sample_users.sql"]],
		}
		exec {"${instance} ${cmd} < 5_sampledata.sql" :
			command => "${cmd} < 5_sampledata.sql",
			unless => "${cmd} ${extra} | grep sampledata${instance}",
			require => [Exec["${instance} ${cmd} < 4_load_sample_users.sql"], File["/tmp/pentaho_${instance}/5_sampledata.sql"]],
		}

	}
}
