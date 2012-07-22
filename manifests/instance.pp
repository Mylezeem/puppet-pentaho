define pentaho::instance (
                          $version = '3.8.0',
						  $log_path = '/var/log',
						  $hsqldb_path = '/opt/hsqldb',
						  $sample = 'false',
						  $user = 'root',
						  $pass = '0996UX',
						  $ip = 'localhost',
                          ) {

	$instance = $name
	$port = hiera('port')

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

	$driver = hiera('dbtype') ? {
		/(mysql|mysql5)/		=>	"com.mysql.jdbc.Driver",
		'postgresql'			=>	"org.postgresql.Driver",
		/(oracle|oracle10g)/	=>	"oracle.jdbc.driver.OracleDriver",
		'hsql'					=>	"org.hsqldb.jdbcDriver",
		default					=>	undef,
	}

	$cntstring = hiera('dbtype') ? {
		/(mysql|mysql5)/		=>	"jdbc:mysql://",
		'postgresql'			=>	"jdbc:postgresql://",
		/(oracle|oracle10g)/	=>	"jdbc:oracle:thin:@",
		'hsql'					=>	"jdbc:hsqldb:hsql://",
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

  pentaho::main_solution {"${name}" :
	require => File["${dirname}"],
  } 

  #
  # Installing the underlying pentaho system tables
  #

  pentaho::backend {"${name}" :
    require => Pentaho::Main_solution["${name}"],
  }

  #
  # Creating Pentaho Roles
  #
  create_resources('pentaho::role', hiera_hash('role'))

  #
  # Creating Pentaho Users
  #
  create_resources('pentaho::user', hiera_hash('user'))

  #
  # Creating the solutions folders 
  #

  create_resources(pentaho::solution, {'clarity' => {}, 'montgomery' => {visible => 'false',}})


  #
  # Installing the pentaho-style folder related to the ${instance} value
  #
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
  require => Pentaho::Backend["${name}"],
}

}
