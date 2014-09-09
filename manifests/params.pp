class pentaho::params {

  $db_user     = 'root'
  $db_password = 'password'
  $db_host     = '127.0.0.1'
  $db_charset  = 'utf8'
  $db_collate  = 'utf8_general_ci'

  $applicationserver_base = '/usr/share/tomcat'

  $manage_db              = 'mysql'
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
