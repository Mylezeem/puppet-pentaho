class sample::data {
	$port				=	'9001'
	$dbtype				=	'hsql'
	$version			=	'3.8.0'
	$pentaho_solution	=	'/opt/pentaho_test/pentaho-solutions/'
	$role				=	{}
	$user				=	{}
	$datasource			=	{}
	$solution			=	{}
}

class sample {
}

define pentaho::instance (
						  $log_path = '/var/log',
						  $hsqldb_path = '/opt/hsqldb',
						  $sample = 'false',
						  $user = 'root',
						  $pass = 'pass',
						  $ip = 'localhost',
                          ) {

	$instance = $name
	$host = 'localhost'
	$port = hiera('port')
	$dbtype = hiera('dbtype')
	$version = hiera('version')

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

	$cntstring = $dbtype ? {
		/(mysql|mysql5)/		=>	"jdbc:mysql://",
		'postgresql'			=>	"jdbc:postgresql://",
		/(oracle|oracle10g)/	=>	"jdbc:oracle:thin:@",
		'hsql'					=>	"jdbc:hsqldb:hsql://",
		default					=>	undef,
	}

	$cmd = $dbtype ? {
		/(mysql|mysql5)/		=>	"mysql -u${user} -p${pass} -h${host} ",
		'postgresql'			=>	"psql -U ${user} -W ${pass} -h ${host} ",
		/(oracle|oracle10g)/	=>	undef,
		'hsql'					=>  "org.hsql.jar",
		default					=>	undef,
	}


	$exe_sql = $dbtype ? {
		/(mysql|mysql5)/		=>	"-e",
		'postgresql'			=>	"-c",
		/(oracle|oracle10g)/	=>	undef,
		'hsql'					=>	"-udnno",
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
  #
  # Creating the pentaho solution folder (and its parents if necessary)
  #

  $h = get_cwd_hash_path(hiera('pentaho_solution'), $name)
  create_resources('file', $h, {'ensure'	=> 'directory', 'owner' => 'root', 'group' => 'root', 'mode' => '0755'})

  #
  # Getting the system & admin folder based on the instance version number, configuring database file properly
  #

  $dirname = pentaho_dirname(hiera('pentaho_solution'))
  $pentaho_solution = hiera('pentaho_solution')

  pentaho::main_solution {"${name}" :
	instance			=> $instance,
	pentaho_solution	=> $pentaho_solution,
	dbtype				=> $dbtype,
	user				=> $user,
	pass				=> $pass,
	host				=> $host,
	port				=> $port,
	version				=> $version,
	driver				=> $driver,
	dialect				=> $dialect,
	delegate			=> $delegate,
	cntstring			=> $cntstring,
	require				=> [Class["git"], Class["tomcat6"], File["${dirname}"]],
  } 

  #
  # Installing the underlying pentaho system tables
  #

  pentaho::backend {"${name}" :
	instance	=> $instance,
	hsqldb_path	=> $hsqldb_path,
	dbtype		=> $dbtype,
	host		=> $host,
	port		=> $port,
	version		=> $version,
	cmd			=> $cmd,
	exe_sql		=> $exe_sql,
    require => Pentaho::Main_solution["${name}"],
  }

  #
  # Creating Pentaho Roles
  #
$pentaho_roles = append_instance_name(hiera_hash('role'), $instance)
 create_resources('pentaho::role', $pentaho_roles,
		{'instance'		=> $instance,
		 'dbtype'		=> $dbtype,
		 'cmd'			=> $cmd,
		 'exe_sql'		=> $exe_sql})
  #
  # Creating Pentaho Users
  #
$pentaho_users = append_instance_name(hiera_hash('user'), $instance)
 create_resources('pentaho::user', $pentaho_users,
		{'instance'		=> $instance,
		 'dbtype'		=> $dbtype,
		 'cmd'			=> $cmd,
		 'exe_sql'		=> $exe_sql})

  #
  # Creating Pentaho Datasources
  #
$pentaho_datasources = append_instance_name(hiera_hash('datasource'), $instance)
 create_resources('pentaho::datasource', $pentaho_datasources,
		{'instance'		=> $instance,
		 'dbtype'		=> $dbtype,
		 'cmd'			=> $cmd,
		 'exe_sql'		=> $exe_sql})

  #
  # Creating the solutions folders 
  #
  $pentaho_solutions = append_instance_name(hiera_hash('solution'), $instance)
 create_resources('pentaho::solution', $pentaho_solutions,
		  {'instance'	=> $instance,
		   'pentaho_solution'	=> $pentaho_solution})

  #
  # Installing the pentaho-style folder related to the ${instance} value
  #
	Exec {require	=> [Class["git"], Class["tomcat6"]] }
	exec {"git clone git://github.com/Spredzy/pentaho-style-${version}.git pentaho-style${name}" :
		cwd	=> "/var/lib/tomcat6/webapps/",
		path => ["/usr/bin", "/bin"],
		unless => "ls /var/lib/tomcat6/webapps/pentaho-style${name}",
		before => Pentaho::Webapps["${name}"],
	}
	exec {"refresh ${name} repo" :
		command => "git pull origin master",
		cwd	=> "/var/lib/tomcat6/webapps/pentaho-style${name}",
		path => ["/usr/bin", "/bin"],
		onlyif => "ls /var/lib/tomcat6/webapps/pentaho-style${name}",
		before => Pentaho::Webapps["${name}"],
	}

 File{ ensure => present, require => [Exec["git clone git://github.com/Spredzy/pentaho-style-${version}.git pentaho-style${name}"], Exec["refresh ${name} repo"]],}
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/active/default.css" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/default.css"),
 }
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/pentaho.css" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/pentaho.css"),
}
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/pentaho.js" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/pentaho.js"),
 }
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/deprecated.css" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/deprecated.css"),
 }
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/styles-new.css" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/styles-new.css"),
 }
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/WEB-INF/skins/winter.properties" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/winter.properties"),
 }
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/WEB-INF/skins/autumn.properties" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/autumn.properties"),
 }
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/WEB-INF/skins/pentaho-skin.properties" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/pentaho-skin.properties"),
 }
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/WEB-INF/skins/salsa.properties" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/salsa.properties"),
 }
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/WEB-INF/skins/white.properties" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/white.properties"),
 }
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/WEB-INF/classes/pentaho-skin.properties" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/pentaho-skin.properties"),
 }
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/images/themes/salsa/salsa.properties" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/salsa.properties"),
 }
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/images/themes/salsa/winter.properties" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/winter.properties"),
 }
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/tabview/css/grey_tabview.css" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/grey_tabview.css"),
 }
 file {"/var/lib/tomcat6/webapps/pentaho-style${name}/tabview/css/tab_content.css" :
	  content	=> template("pentaho/webapps/pentaho-style-${version}/pentaho-style/tab_content.css"),
 }


  #
  # Creating the Pentaho instance
  #

pentaho::webapps{"${name}" :
	instance	=> $instance,
	dbtype		=> $dbtype,
	host		=> $host,
	port		=> $port,
	driver		=> $driver,
	cntstring	=> $cntstring,
	version		=> $version,
	hsqldb_path	=> $hsqldb_path,
	log_path	=> $log_path,
	require => Pentaho::Backend["${name}"],
}

}
