class pentaho::webapp {

  exec { '/bin/cp -r /tmp/biserver-ce/tomcat/webapps/pentaho* /usr/share/tomcat/webapps/' :
    unless => '/bin/stat /usr/share/tomcat/webapps/pentaho',
  }

  file { '/usr/share/tomcat/webapps/META-INF/context.xml' :
    ensure  => present,
    content => template("pentaho/context/${pentaho::manage_db}/context.xml.erb"),
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
      "set web-app/context-param[2]/param-value/#text http://${::ipaddress}:8080/pentaho",
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

}
