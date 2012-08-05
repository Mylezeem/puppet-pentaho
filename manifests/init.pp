class pentaho::data {
	$port				=	'9001'
	$dbtype				=	'hsql'
	$version			=	'3.8.0'
	$pentaho_solution	=	'/opt/pentaho_test/pentaho-solutions/'
	$role				=	{}
	$user				=	{}
	$datasource			=	{}
	$solution			=	{}
}

class pentaho {
	include git, tomcat6, pentaho::params, pentaho::install
}
