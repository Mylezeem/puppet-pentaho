class pentaho (
  $version                 = $pentaho::params::version,
  $applicationserver_base  = $pentaho::params::applicationserver_base,
  $applicationserver_user  = $pentaho::params::applicationserver_user,
  $applicationserver_group = $pentaho::params::applicationserver_user,
  $listen_ip               = $pentaho::params::listen_ip,
  $language                = $pentaho::params::language,
  $country                 = $pentaho::params::country,
  $manage_jdbc_drivers     = $pentaho::params::manage_jdbc_drivers ,
  $db_type                 = $pentaho::params::db_type,
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
