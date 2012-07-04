define pentaho::backend() {

	if $dbtype == 'hsql' {

		$h = get_cwd_hash_path("${pentaho_solution}/hsqldb_${name}", $name)
		create_resources('file', $h)

		exec {"git clone git://github.com/Spredzy/hsqldb.git hsqldb_${name}" :
			cwd     => "${hsqldb_path}",
			path    =>  ["/usr/bin", "/bin", "/usr/sbin"],
			unless  =>  "ls ${hsqldb}/hsqldb_${name}",
			require => File["data_dir"],
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

		file {"/tmp/pentaho_${name}" : 
			ensure => directory,
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
		exec {"${cmd} < 1_create_repository.sql" :
			unless => "${cmd} ${extra} | grep hibernate${name}",
			require => File["/tmp/pentaho_${name}/1_create_repository.sql"],
		}
		exec {"${cmd} < 2_create_quartz.sql" :
			unless => "${cmd} ${extra} | grep quartz${name}",
			require => [Exec["${cmd} < 1_create_repository.sql"],File["/tmp/pentaho_${name}/2_create_quartz.sql"]],
		}
		exec {"${cmd} < 3_create_sample_datasource.sql" :
			unless => "${cmd} hibernate${name} ${exe_sql} 'SELECT NAME FROM DATASOURCE' | grep SampleData",
			require => [Exec["${cmd} < 2_create_quartz.sql"],File["/tmp/pentaho_${name}/3_create_sample_datasource.sql"]],
		}
		exec {"${cmd} < 4_load_sample_users.sql" :
			unless => "${cmd} hibernate${name} ${exe_sql} 'SELECT USERNAME FROM USERS' | grep joe",
			require => [Exec["${cmd} < 3_create_sample_datasource.sql"],File["/tmp/pentaho_${name}/4_load_sample_users.sql"]],
		}
		exec {"${cmd} < 5_sampledata.sql" :
			unless => "${cmd} ${extra} | grep sampledata${name}",
			require => [Exec["${cmd} < 4_load_sample_users.sql"], File["/tmp/pentaho_${name}/5_sampledata.sql"]],
		}

	}
}
