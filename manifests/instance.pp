define pentaho::instance (
                          $version = '3.8.0',
                          $pentaho_solution = '/opt/pentaho/itestyanis/pentaho_solutionstest',
						  $sample = 'false',
						  $dbtype = 'mysql5',
						  $user = 'root',
						  $pass = 'bitfocus',
						  $ip = '192.168.1.1',
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
  # Creating the solutions folders 
  #

#  create_resources(pentaho::solution, {'clarity' => {}, 'montgomery' => {visible => 'false',}})

}
