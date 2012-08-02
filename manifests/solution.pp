define pentaho::solution(
						$instance,
						$pentaho_solution,
						$icon = 'reporting.png',
						$visible = 'true',
						$displaytype = 'list',
						){

  $solution_name = remove_instance_name($name, $instance)
  $description = $solution_name

  File { require => Pentaho::Main_solution["${instance}"], }
  file {"${pentaho_solution}/${solution_name}" :
	ensure => directory,
  }
  file {"${pentaho_solution}/${solution_name}/index.xml" :
	ensure => present,
	content => template("pentaho/solutions/index.xml"),
  }

}
