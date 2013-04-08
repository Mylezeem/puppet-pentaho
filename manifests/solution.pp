define pentaho::solution (
	$solution_path,
	$tmp_path,
	$webapps_path,
	$version
) {

	validate_absolute_path($solution_path)
	validate_absolute_path($tmp_path)
	validate_absolute_path($webapps_path)
	validate_string($version)

	$h = get_dir_hash_path($solution_path)
  create_resources('file', $h, {'ensure'	=> 'directory', 'owner' => 'root', 'group' => 'root', 'mode' => '0755'})

	exec {'copy pentaho-solutions' :
		cwd => '/',
		path => '/bin',
		command => "cp -r ${tmp_path}/biserver-manual-ce-${version}-stable/biserver-manual-ce/pentaho-solutions ${solution_path}/pentaho_${name}/",
		unless => "ls ${solution_path}/pentaho_${name}",
	}
	
	#
	# Authentication related files
	#
	File {
		ensure => present,
		require => Exec['copy pentaho-solutions'],
	}
	file {"${pentaho_solution}/system/applicationContext-spring-security-hibernate.properties" :
		content => template("pentaho/${version}/system/applicationContext-spring-security-hibernate.properties")
	}
	file {"${pentaho_solution}/system/applicationContext-spring-security-jdbc.xml" :
		content => template("pentaho/${version}/system/applicationContext-spring-security-jdbc.xml"),
	}
	file {"${pentaho_solution}/system/hibernate/mysql5.hibernate.cfg.xml" :
		content => template("pentaho/${version}/system/hibernate/mysql5.hibernate.cfg.xml"),
	}
	file {"${pentaho_solution}/system/hibernate/hibernate-settings.xml" :
		content => template("pentaho/${version}/system/hibernate/hibernate-settings.xml"),
	}
	file {"${pentaho_solution}/system/quartz/quartz.properties" :
		content => template("pentaho/${version}/system/quartz/quartz.properties"),
	}
	file {"${pentaho_solution}/system/simple-jndi/jdbc.properties" :
		content => template("pentaho/${version}/system/simple-jndi/jdbc.properties"),
	}


}
