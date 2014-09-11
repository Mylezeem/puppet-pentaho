class pentaho::config {

  exec { '/bin/mkdir -p /opt/pentaho' :
    unless => '/bin/stat /opt/pentaho',
  } ->
  exec { '/bin/cp -r /tmp/biserver-ce/pentaho-solutions /opt/pentaho' :
    unless => '/bin/stat /opt/pentaho/pentaho-solutions',
  }

  # Specify the hibernate file to use
  $hibernate_file = $pentaho::manage_db ? { 
    'mysql' => 'mysql5.hibernate.cfg.xml',
    'pgsql' => 'postgresql.hibernate.cfg.xml',
  }
  augeas { 'config_file' :
    lens    => 'Xml.lns',
    incl    => '/opt/pentaho/pentaho-solutions/system/hibernate/hibernate-settings.xml',
    changes => [
      "set settings/config-file/#text system/hibernate/${hibernate_file}",
    ],
  }

  # Specify delegate class
  $delegate_class = $pentaho::manage_db ? { 
    'mysql' => 'org.quartz.impl.jdbcjobstore.StdJDBCDelegate',
    'pgsql' => 'org.quartz.impl.jdbcjobstore.PostgreSQLDelegate',
  }

  augeas { 'quart_properties' :
    lens    => 'simplevars.lns',
    incl    => '/opt/pentaho/pentaho-solutions/system/quartz/quartz.properties',
    changes => [
      "set org.quartz.jobStore.driverDelegateClass ${delegate_class}",
    ],
  }

  file { '/opt/pentaho/pentaho-solutions/system/jackrabbit/repository.xml' :
    ensure  => present,
    content => template("pentaho/jackrabbit/${pentaho::manage_db}/repository.xml.erb"),
  }

}
