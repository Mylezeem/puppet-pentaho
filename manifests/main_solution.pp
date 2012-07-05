define pentaho::main_solution (
								) {


	#
	# Setting the correct variable value to use in the template
	#
	# As for now handling :
	#
	#						- HyperSonic (hsql)
	#						- MySQL (mysql5)
	#						- Postgresql (postgresql)
	#						- Oracle (oracle10g)
	#
	#

	$driver = $dbtype ? {
		/(mysql|mysql5)/		=>	"com.mysql.jdbc.Driver",
		'postgresql'			=>	"org.postgresql.Driver",
		/(oracle|oracle10g)/	=>	"oracle.jdbc.driver.OracleDriver",
		'hsql'					=>	"org.hsqldb.jdbcDriver",
		default					=>	undef,
	}

	$dialect = $dbtype ? {
		/(mysql|mysql5)/		=>	"MySQL5InnoDBDialect",
		'postgresql'			=>	"PostgreSQLDialect",
		/(oracle|oracle10g)/	=>	"Oracle10gDialect",
		'hsql'					=>	"HSQLDialect",
		default					=>	undef,
	}

	$delegate = $dbtype ? {
		/(mysql|mysql5)/		=>	"StdJDBCDelegate",
		'postgresql'			=>	"PostgreSQLDelegate",
		/(oracle|oracle10g)/	=>	"oracle.OracleDelegate",
		'hsql'					=>	"StdJDBCDelegate",
		default					=>	undef,
	}

	$cntstring = $dbtype ? {
		/(mysql|mysql5)/		=>	"jdbc:mysql://",
		'postgresql'			=>	"jdbc:postgresql://",
		/(oracle|oracle10g)/	=>	"jdbc:oracle:thin:@",
		'hsql'					=>	"jdbc:hsqldb:hsql://",
		default					=>	undef,
	}

	#
	# Getting the system and admin folders on a public repo (GitHub)
	#
	
	$to_git_path = pentaho_dirname($pentaho_solution)
	$pentaho_solution_folder_name = pentaho_basename($pentaho_solution)
	
	exec {"Get files Pentaho ${version} for  ${name}" :
		cwd => $to_git_path,
		path => ["/usr/bin", "/usr/sbin", "/bin"],
		command => "git clone https://github.com/Spredzy/pentaho-solutions.git ${pentaho_solution_folder_name}",
		unless => "ls ${pentaho_solution}",
		require => File["${to_git_path}"],
	}

	exec {"Update pentaho solution systeamd & admin folder for  Pentaho ${version} for  ${name}" :
		cwd => $pentaho_solution,
		path => ["/usr/bin", "/usr/sbin", "/bin"],
		command => "git pull origin master",
		onlyif => "ls ${pentaho_solution}",
	}

	#
	# Configuring the database related file for hibernate
	#

	File { require => [Exec["Get files Pentaho ${version} for  ${name}"], Exec["Update pentaho solution systeamd & admin folder for  Pentaho ${version} for  ${name}"]], }
	file {"${pentaho_solution}/system/applicationContext-spring-security-hibernate.properties" :
		ensure => present,
		content => template("pentaho/system/applicationContext-spring-security-hibernate-${version}.properties"),
	}

	file {"${pentaho_solution}/system/applicationContext-spring-security-jdbc.xml" :
		ensure => present,
		content => template("pentaho/system/applicationContext-spring-security-jdbc-${version}.xml"),
	}

	file {"${pentaho_solution}/system/hibernate/${dbtype}.hibernate.cfg.xml" :
		ensure => present,
		content => template("pentaho/system/${dbtype}.hibernate.cfg-${version}.xml"),
	}

	file {"${pentaho_solution}/system/hibernate/hibernate-settings.xml" :
		ensure => present,
		content => template("pentaho/system/hibernate-settings-${version}.xml"),
	}

	file {"${pentaho_solution}/system/quartz/quartz.properties" :
		ensure => present,
		content => template("pentaho/system/quartz-${version}.properties"),
	}

	file {"${pentaho_solution}/system/simple-jndi/jdbc.properties" :
		ensure => present,
		content => template("pentaho/system/jdbc.properties"),
	}

	file {"${pentaho_solution}/system/logs" :
		ensure	=>	directory,
		group	=>	tomcat6,
		mode	=>	'0775',
	}
}	
