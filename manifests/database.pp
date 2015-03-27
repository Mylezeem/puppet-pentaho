# == Class: pentaho::database
#
# A puppet module that installs and configures the required databases for Pentaho BA Server
#
# === Parameters
#
#  [*db_type*]
#    (string) The type of the database backend
#    Default: mysql
#
#  [*db_host*]
#    (string) The host of the database backend
#    Default: localhost
#
#  [*db_port*]
#    (string) The port of the database backend
#    Default: 3306
#
#  [*quartz_db_user*]
#    (string) The quartz database user name
#    Default: pentaho_user
#
#  [*quartz_db_password*]
#    (string) The quartz database user password
#    Default: password
#
#  [*hibernate_db_user*]
#    (string) The hibernate database user name
#    Default: hibuser
#
#  [*hibernate_db_password*]
#    (string) The hibernate database user password
#    Default: password
#
#  [*jackrabbit_db_user*]
#    (string) The jackrabbit database user name
#    Default: jcr_user
#
#  [*jackrabbit_db_password*]
#    (string) The jackrabbit database user password
#    Default: password
#
#  [*db_charset*]
#    (string) The character set of the database
#    Default: utf8
#
#  [*db_collate*]
#    (string) The collate of the database
#    Default: utf8_general_ci
#
# === Examples
#
#  include pentaho::database
#
#    or
#
#  class { 'pentaho::database' :
#    version => '5.1',
#    applicationserver_base  = '/srv/tomcat',
#    applicationserver_user  = 'tomcat6',
#    applicationserver_group = 'tomcat6',
#    db_host                 = '192.168.100.101',
#  }
#
# === Authors
#
# Yanis Guenane <yguenane@gmail.com>
#
# === Copyright
#
# Copyright 2014 Yanis Guenane
#
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

  file { "${pentaho::temp_folder}/quartz.sql" :
    ensure => file,
    source => "puppet:///modules/pentaho/${pentaho::version}/${pentaho::db_type}/create_quartz.sql",
    before => Mysql::Db['quartz'],
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
      } ->
      mysql::db { 'jackrabbit' :
        user     => $jackrabbit_db_user,
        password => $jackrabbit_db_password,
        charset  => $db_charset,
        collate  => $db_collate,
      }
    }
    'pgsql' : {
      notice('not implemented yet')
    }
    default : { notice('not supported') }
  }

}
