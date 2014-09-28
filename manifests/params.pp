class pentaho::params {

  $version = '5.1'

  # Application Server
  $applicationserver_base  = '/usr/share/tomcat'
  $applicationserver_user  = 'tomcat'
  $applicationserver_group = 'tomcat'

  # Database
  $db_type             = 'mysql'
  $db_host             = 'localhost'
  $db_port             = 3306
  $manage_jdbc_drivers = ['mysql', 'h2']
  $h2driver_source_url = 'http://repo2.maven.org/maven2/com/h2database/h2/1.4.181/h2-1.4.181.jar'

  $quartz_db_user         = 'pentaho_user'
  $quartz_db_password     = 'password'
  $hibernate_db_user      = 'hibuser'
  $hibernate_db_password  = 'password'
  $jackrabbit_db_user     = 'jcr_user'
  $jackrabbit_db_password = 'password'
  $db_charset             = 'utf8'
  $db_collate             = 'utf8_general_ci'

  # Pentaho
  $listen_ip              = $::ipaddress
  $language               = 'en'
  $country                = 'US'
  $pentaho_solutions_path = '/opt/pentaho/'
  $pentaho_source_url     = 'http://downloads.sourceforge.net/project/pentaho/Business%20Intelligence%20Server/5.1/biserver-ce-5.1.0.0-752.zip?r=&ts=1410402175&use_mirror=iweb'
  $temp_folder            = '/var/tmp'
  $log_directory          = '/var/log/pentaho'

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
