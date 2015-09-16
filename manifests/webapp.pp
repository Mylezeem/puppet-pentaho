# == Class: pentaho::webapp
class pentaho::webapp {

  # JOE
  if $::osfamily == 'Windows' {
    $exec_provider = 'cygwin'
  } else { 
    $exec_provider = 'posix'
  }
  
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  exec { "/bin/cp -r ${pentaho::temp_folder}/biserver-ce/tomcat/webapps/pentaho* '${pentaho::applicationserver_base}/webapps/'" :
    unless => "/usr/bin/stat ${pentaho::applicationserver_base}/webapps/pentaho",
    provider    => $exec_provider,
  } ->
  file { "${pentaho::applicationserver_base}/webapps/pentaho/META-INF/context.xml" :
    ensure  => file,
    content => template("pentaho/context/${pentaho::db_type}/context.xml.erb"), 
  }

  unless $::osfamily == 'Windows' {
	  Augeas {
	    require => File["${pentaho::applicationserver_base}/webapps/pentaho/META-INF/context.xml"],
	  }
	  if $pentaho::manage_tomcat_web_xml {
		  augeas { 'base_solution' :
		    lens    => 'Xml.lns',
		    incl    => "${pentaho::applicationserver_base}/webapps/pentaho/WEB-INF/web.xml",
		    changes => [
		      "set web-app/context-param[1]/param-value/#text ${pentaho::pentaho_solutions_path}/pentaho-solutions",
		    ],
		  }
		  augeas { 'listen_address' :
		    lens    => 'Xml.lns',
		    incl    => "${pentaho::applicationserver_base}/webapps/pentaho/WEB-INF/web.xml",
		    changes => [
		      "set web-app/context-param[3]/param-value/#text http://${pentaho::listen_ip}:8080/pentaho",
		    ],
		  }
		  augeas { 'rm_hsqldb_autostartup' :
		    lens    => 'Xml.lns',
		    incl    => "${pentaho::applicationserver_base}/webapps/pentaho/WEB-INF/web.xml",
		    changes => [
		      "rm /files${pentaho::applicationserver_base}/webapps/pentaho/WEB-INF/web.xml/web-app/context-param[10]",
		    ],
		  }
		  augeas { 'rm_hsqldb_listener' :
		    lens    => 'Xml.lns',
		    incl    => "${pentaho::applicationserver_base}/webapps/pentaho/WEB-INF/web.xml",
		    changes => [
		      "rm /files${pentaho::applicationserver_base}/webapps/pentaho/WEB-INF/web.xml/web-app/listener[3]",
		    ],
		  }
	  }
	}

  file { "${pentaho::applicationserver_base}/webapps/pentaho/WEB-INF/classes/log4j.xml" :
    ensure  => file,
    content => template('pentaho/log4j/log4j_pentaho.xml.erb'),
    require => File["${pentaho::applicationserver_base}/webapps/pentaho/META-INF/context.xml"],
  }

}
