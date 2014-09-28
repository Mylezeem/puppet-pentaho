class pentaho::config {

  exec { "/bin/mkdir -p ${pentaho::pentaho_solutions_path}" :
    unless => "/usr/bin/stat ${pentaho::pentaho_solutions_path}",
  } ->
  exec { "/bin/cp -r ${pentaho::temp_folder}/biserver-ce/pentaho-solutions ${pentaho::pentaho_solutions_path}" :
    unless => "/usr/bin/stat ${pentaho::solutions_path}/pentaho-solutions",
  }

  Augeas {
    require => Exec["/bin/cp -r ${pentaho::temp_folder}/biserver-ce/pentaho-solutions ${pentaho::pentaho_solutions_path}"],
  }
  # Specify the hibernate file to use
  $hibernate_file = $pentaho::db_type ? {
    'mysql' => 'mysql5.hibernate.cfg.xml',
    'pgsql' => 'postgresql.hibernate.cfg.xml',
  }
  augeas { 'config_file' :
    lens    => 'Xml.lns',
    incl    => "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/hibernate/hibernate-settings.xml",
    changes => [
      "set settings/config-file/#text system/hibernate/${hibernate_file}",
    ],
  }

  # Specify delegate class
  $delegate_class = $pentaho::db_type ? {
    'mysql' => 'org.quartz.impl.jdbcjobstore.StdJDBCDelegate',
    'pgsql' => 'org.quartz.impl.jdbcjobstore.PostgreSQLDelegate',
  }

  augeas { 'quartz_properties' :
    lens    => 'simplevars.lns',
    incl    => "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/quartz/quartz.properties",
    changes => [
      "set org.quartz.jobStore.driverDelegateClass ${delegate_class}",
    ],
  }

  File {
    require => Exec["/bin/cp -r ${pentaho::temp_folder}/biserver-ce/pentaho-solutions ${pentaho::pentaho_solutions_path}"],
  }

  file { "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/jackrabbit/repository.xml" :
    ensure  => present,
    content => template("pentaho/jackrabbit/${pentaho::db_type}/repository.xml.erb"),
  }

  # TODO (spredzy) : Currently use template but final goal
  #                  is to use augeas currently hitting bug
  #                  https://github.com/hercules-team/augeas/pull/158
  file { "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/osgi/log4j.xml" :
    ensure  => present,
    content => template("pentaho/log4j/log4j_osgi.xml.erb"),
  }

  # Fixing incorrect permissions
  $directories = ["${pentaho::pentaho_solutions_path}/pentaho-solutions/system/osgi", "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/logs", "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/logs/audit", "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/jackrabbit", $pentaho::log_directory]

  file { $directories :
    ensure  => directory,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0755',
  }

}
