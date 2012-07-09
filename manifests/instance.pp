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
  # Creating the solutions folders 
  #

#  create_resources(pentaho::solution, {'clarity' => {}, 'montgomery' => {visible => 'false',}})


  #
  # Creating the Pentaho instance
  #

	pentaho::webapps{"${name}" :
		require => Pentaho::Backend["${name}"],
	}

}
