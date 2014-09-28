class pentaho::database (
  $db_type                = $pentaho::params::db_type,
  $db_host                = $pentaho::params::db_host,
  $db_port                = $pentaho::params::db_port,
  $quartz_db_user         = $pentaho::params::quartz_db_user,
  $quartz_db_password     = $pentaho::params::quartz_db_password,
  $hibernate_db_user      = $pentaho::params::hibernate_db_user,
  $hibernate_db_password  = $pentaho::params::hibernate_db_password,
  $jackrabbit_db_user     = $pentaho::params::jackrabbit_db_user,
  $jackrabbit_db_password = $pentaho::params::jackrabbit_db_password,
  $db_charset             = $pentaho::params::db_charset,
  $db_collate             = $pentaho::params::db_collate,
) inherits pentaho::params {

  File {
    ensure => present,
    before => Mysql::Db['quartz'],
  }

  file {
    "${pentaho::temp_folder}/quartz.sql" :
      source => "puppet:///modules/pentaho/${pentaho::version}/${pentaho::db_type}/create_quartz.sql";
 #   "${pentaho::temp_folder}/repository.sql" :
 #     source => "puppet:///modules/pentaho/${pentaho::version}/${pentaho::db_type}/create_repository.sql";
 #   "${pentaho::temp_folder}/jcr.sql" :
 #     source => "puppet:///modules/pentaho/${pentaho::version}/${pentaho::db_type}/create_jcr.sql";
  }

  case $pentaho::db_type {
    'mysql' : {
       mysql::db { 'quartz' :
         user     => $quartz_db_user,
         password => $quartz_db_password,
         charset  => $db_charset,
         collate  => $db_collate,
         sql      => "${pentaho::temp_folder}/quartz.sql",
         require  => Class['mysql::server'],
       } ->
       mysql::db { 'repository' :
         user     => $hibernate_db_user,
         password => $hibernate_db_password,
         charset  => $db_charset,
         collate  => $db_collate,
#         sql      => "${pentaho::temp_folder}/repository.sql",
       } ->
       mysql::db { 'jackrabbit' :
         user     => $jackrabbit_db_user,
         password => $jackrabbit_db_password,
         charset  => $db_charset,
         collate  => $db_collate,
 #        sql      => "${pentaho::temp_folder}/jcr.sql",
       }

    }
    'pgsql' : {
      notice('not implemented yet')
    }
    default : { notice('not supported') }
  }

}
