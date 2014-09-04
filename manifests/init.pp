class pentaho (
  $applicationserver_base = $pentaho::params::applicationserver_base,
  $manage_jdbc_drivers    = $pentaho::params::manage_jdbc_drivers ,
) inherits pentaho::params {

  include ::stdlib

  anchor {'pentaho::begin' : } ->
  class { 'pentaho::setup' : } ->
  anchor {'pentaho::end' : }

}
