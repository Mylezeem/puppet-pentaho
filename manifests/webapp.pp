class pentaho::webapp {

  exec { '/bin/cp -r /tmp/biserver-ce/tomcat/webapps/pentaho* /usr/share/tomcat/webapps/' :
    unless => '/usr/bin/stat /usr/share/tomcat/webapps/pentaho',
  } ->
  file { '/usr/share/tomcat/webapps/pentaho/META-INF/context.xml' :
    ensure  => present,
    content => template("pentaho/context/${pentaho::manage_db}/context.xml.erb"),
  }

  Augeas {
    require => File['/usr/share/tomcat/webapps/pentaho/META-INF/context.xml'],
  }
  augeas { 'base_solution' :
    lens    => 'Xml.lns',
    incl    => '/usr/share/tomcat/webapps/pentaho/WEB-INF/web.xml',
    changes => [
      "set web-app/context-param[1]/param-value/#text /opt/pentaho/pentaho-solutions",
    ],
  }
  augeas { 'listen_address' :
    lens    => 'Xml.lns',
    incl    => '/usr/share/tomcat/webapps/pentaho/WEB-INF/web.xml',
    changes => [
      "set web-app/context-param[3]/param-value/#text http://${::ipaddress}:8080/pentaho",
    ],
  }
  augeas { 'language' :
    lens    => 'Xml.lns',
    incl    => '/usr/share/tomcat/webapps/pentaho/WEB-INF/web.xml',
    changes => [
      "set web-app/context-param[4]/param-value/#text fr",
    ],
  }
  augeas { 'country' :
    lens    => 'Xml.lns',
    incl    => '/usr/share/tomcat/webapps/pentaho/WEB-INF/web.xml',
    changes => [
      "set web-app/context-param[5]/param-value/#text FR",
    ],
  }
  augeas { 'rm_hsqldb_autostartup' :
    lens    => 'Xml.lns',
    incl    => '/usr/share/tomcat/webapps/pentaho/WEB-INF/web.xml',
    changes => [
      "rm /files/usr/share/tomcat/webapps/pentaho/WEB-INF/web.xml/web-app/context-param[10]",
    ],
  }
  augeas { 'rm_hsqldb_listener' :
    lens    => 'Xml.lns',
    incl    => '/usr/share/tomcat/webapps/pentaho/WEB-INF/web.xml',
    changes => [
      "rm /files/usr/share/tomcat/webapps/pentaho/WEB-INF/web.xml/web-app/listener[3]",
    ],
  }

  file { '/usr/share/tomcat/webapps/pentaho/WEB-INF/classes/log4j.xml' :
    ensure  => present,
    content => template("pentaho/log4j/log4j_pentaho.xml.erb"),
    require => File['/usr/share/tomcat/webapps/pentaho/META-INF/context.xml'],
  }

}
