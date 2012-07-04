define pentaho::solution(
						$description = $name,
						$icon = 'reporting.png',
						$visible = 'true',
						$displaytype = 'list',
						){


  file {"${pentaho_solution}/${name}" :
	ensure => directory,
  }

 file {"${pentaho_solution}/${name}/index.xml" :
	ensure => present,
	content => template("pentaho/solutions/index.xml"),
 }

}
