define pentaho::instance (
                          $version = '3.8.0',
                          $pentaho_solution = '/opt/pentaho/itestyanis/pentaho_solutionstest',
						  $hsqldb_path = '/opt/hsqldb',
						  $sample = 'false',
						  $dbtype = 'mysql5',
						  $user = 'root',
						  $pass = '0996UX',
						  $ip = '127.0.0.1',
						  $port = '3306',
                          ) {

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

}
