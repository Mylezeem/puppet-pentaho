define pentaho::instance (
                          $version = '3.8.0',
                          $pentaho_solution = '/opt/pentaho/itestyanis/pentaho_solutionstest',
						  $log_path = '/var/log',
						  $hsqldb_path = '/opt/hsqldb',
						  $sample = 'false',
						  $dbtype = 'mysql5',
						  $user = 'root',
						  $pass = '0996UX',
						  $ip = 'localhost',
						  $port = '3306',
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

	$cntstring = $dbtype ? {
		/(mysql|mysql5)/		=>	"jdbc:mysql://",
		'postgresql'			=>	"jdbc:postgresql://",
		/(oracle|oracle10g)/	=>	"jdbc:oracle:thin:@",
		'hsql'					=>	"jdbc:hsqldb:hsql://",
		default					=>	undef,
	}

  #
  # Creating the pentaho solution folder (and its parents if necessary)
  #

  $h = get_cwd_hash_path($pentaho_solution, $name)
  create_resources('file', $h)

  #
  # Getting the system & admin folder based on the instance version number, configuring database file properly
  #

  pentaho::main_solution {"${name}" :
  }

  #
  # Installing the underlying pentaho system bases
  #

  pentaho::backend {"${name}" :
  }

  #
  # Creating the solutions folders 
  #

#  create_resources(pentaho::solution, {'clarity' => {}, 'montgomery' => {visible => 'false',}})


  #
  # Creating the Pentaho instance
  #

  pentaho::webapps{"${name}" :
  }

}
