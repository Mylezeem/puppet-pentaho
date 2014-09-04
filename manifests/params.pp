class pentaho::params {

  $applicationserver_base = '/usr/share/tomcat'
  $manage_jdbc_drivers    = ['mysql', 'h2']

  case $::osfamily {
    'RedHat' : {
      $postgresql_jdbc_driver_package = 'postgresql-jdbc'
    }
    'Debian' : {
      $postgresql_jdbc_driver_package = 'libpostgresql-jdbc-java'
    }
    default : { fail("The ${::osfamily} operating system is not supported with the pentaho module") }
  }
}
