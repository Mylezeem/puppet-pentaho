define pentaho::instance (
                          $version = '3.8.0',
                          $pentaho_solution = '/opt/pentaho/itestyanis/pentaho_solutionstest'
                          ) {

  #
  # Creating the pentaho solution folder (and its parents if necessary)
  #
  $h = get_cwd_hash_path($pentaho_solution, $name)
  create_resources('file', $h)


}
