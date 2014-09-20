class pentaho::database (
  $db_type     = $pentaho::params::db_type,
  $db_user     = $pentaho::params::db_user,
  $db_password = $pentaho::params::db_password,
  $db_host     = $pentaho::params::db_host,
  $db_charset  = $pentaho::params::db_charset,
  $db_collate  = $pentaho::params::db_collate,
) inherits pentaho::params {

  File {
    ensure => present,
    before => Mysql::Db['quartz'],
  }

  file {
    "${pentaho::temp_folder}/quartz.sql" :
      source => "puppet:///modules/pentaho/${pentaho::version}/${pentaho::db_type}/create_quartz.sql";
    "${pentaho::temp_folder}/repository.sql" :
      source => "puppet:///modules/pentaho/${pentaho::version}/${pentaho::db_type}/create_repository.sql";
    "${pentaho::temp_folder}/jcr.sql" :
      source => "puppet:///modules/pentaho/${pentaho::version}/${pentaho::db_type}/create_jcr.sql";
  }

  case $pentaho::db_type {
    'mysql' : {
       mysql::db { 'quartz' :
         user     => $db_user,
         password => $db_password,
         charset  => $db_charset,
         collate  => $db_collate,
         sql      => "${pentaho::temp_folder}/quartz.sql",
         require  => Class['mysql::server'],
       } ->
       mysql::db { 'repository' :
         user     => $db_user,
         password => $db_password,
         charset  => $db_charset,
         collate  => $db_collate,
         sql      => "${pentaho::temp_folder}/repository.sql",
       } ->
       mysql::db { 'jcr' :
         user     => $db_user,
         password => $db_password,
         charset  => $db_charset,
         collate  => $db_collate,
         sql      => "${pentaho::temp_folder}/jcr.sql",
       }

    }
    'pgsql' : {
      notice('not implemented yet')
    }
    default : { notice('not supported') }
  }

}
