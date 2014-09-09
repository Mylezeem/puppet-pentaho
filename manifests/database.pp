class pentaho::database (
  $db_user     = $pentaho::params::db_user,
  $db_password = $pentaho::params::db_password,
  $db_host     = $pentaho::params::db_host,
  $db_charset  = $pentaho::params::db_charset,
  $db_collate  = $pentaho::params::db_collate,
) inherits pentaho::params {

  File {
    ensure => present,
    before => Mysql::db['quartz'],
  }

  file {
    '/tmp/quartz.sql' :
      source => "puppet:///modules/pentaho/${pentaho::version}/${pentaho::manage_db}/create_quartz.sql";
    '/tmp/hibernate.sql' :
      source => "puppet:///modules/pentaho/${pentaho::version}/${pentaho::manage_db}/create_hibernate.sql";
    '/tmp/jcr.sql' :
      source => "puppet:///modules/pentaho/${pentaho::version}/${pentaho::manage_db}/create_jcr.sql";
  }

  case $pentaho::manage_db {
    'mysql' : {
       include ::mysql::server
	
       mysql::db { 'quartz' :
         user     => $db_user,
         password => $db_password,
         charset  => $db_charset,
         collate  => $db_collate,
         sql      => '/tmp/quartz.sql',
       } ->
       mysql::db { 'hibernate' :
         user     => $db_user,
         password => $db_password,
         charset  => $db_charset,
         collate  => $db_collate,
         sql      => '/tmp/hibernate.sql',
       } ->
       mysql::db { 'jcr' :
         user     => $db_user,
         password => $db_password,
         charset  => $db_charset,
         collate  => $db_collate,
         sql      => '/tmp/jcr.sql',
       }

    }
    'pgsql' : {
      notice('not implemented yet')
    }
    default { notice('not supported') }
  }

}
