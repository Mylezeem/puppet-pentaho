# == Class: pentaho
#
# A puppet module that installs and configures the Pentaho BA Server for the 5.x branch
#
# === Parameters
#
#  [*version*]
#    (float) The Pentaho BA server version that will be installed. 
#    Default: 5.1
#
#  [*applicationserver_base*]
#    (string) The application server directory
#    Default: /usr/share/tomcat
#
#  [*applicationserver_user*]
#    (string) The application server user name. 
#    Default: tomcat 
#
#  [*applicationserver_group*]
#    (string) The application server group name. 
#    Default: tomcat 
#
#  [*listen_ip*]
#    (string) The IP address Pentaho shoud listen on
#    Default: %{::ipaddress}
#
#  [*manage_jdbc_drivers*]
#    (array) A list of jdbc drivers the installation should manage
#    Default: ['h2', 'mysql']
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
#  [*pentaho_solutions_path*]
#    (string) The pentaho-solutions directory path
#    Default: /opt/pentaho/pentaho-solutions
#
#  [*pentaho_source_url*]
#    (string) The pentaho source url
#    Default: refer to the params file
#
#  [*h2driver_source_url*]
#    (string) The h2 driver source url
#    Default: refer to the params file
#
#  [*temp_folder*]
#    (string) A temporary folder that will server as cache and drop temporary file into
#    Default: /tmp
#
#  [*log_directory*]
#    (string) The log directory
#    Default: /var/log/pentaho
#
# === Examples
#
#  include pentaho
#
#    or
#
#  class { pentaho:
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
class pentaho (
  $version                 = $pentaho::params::version,
  $applicationserver_base  = $pentaho::params::applicationserver_base,
  $applicationserver_user  = $pentaho::params::applicationserver_user,
  $applicationserver_group = $pentaho::params::applicationserver_user,
  $listen_ip               = $pentaho::params::listen_ip,
  $manage_jdbc_drivers     = $pentaho::params::manage_jdbc_drivers ,
  $db_type                 = $pentaho::params::db_type,
  $db_host                 = $pentaho::params::db_host,
  $db_port                 = $pentaho::params::db_port,
  $quartz_db_user          = $pentaho::params::quartz_db_user,
  $quartz_db_password      = $pentaho::params::quartz_db_password,
  $hibernate_db_user       = $pentaho::params::hibernate_db_user,
  $hibernate_db_password   = $pentaho::params::hibernate_db_password,
  $jackrabbit_db_user      = $pentaho::params::jackrabbit_db_user,
  $jackrabbit_db_password  = $pentaho::params::jackrabbit_db_password,
  $pentaho_solutions_path  = $pentaho::params::pentaho_solutions_path,
  $pentaho_source_url      = $pentaho::params::pentaho_source_url,
  $h2driver_source_url     = $pentaho::params::h2driver_source_url,
  $temp_folder             = $pentaho::params::temp_folder,
  $log_directory           = $pentaho::params::log_directory,
) inherits pentaho::params {

  include ::stdlib

  anchor {'pentaho::begin' : } ->
  class { 'pentaho::setup' : } ->
  class { 'pentaho::config' : } ->
  class { 'pentaho::webapp' : } ->
  anchor {'pentaho::end' : }

}
