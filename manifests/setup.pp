# == Class: pentaho::setup
class pentaho::setup {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  if 'mysql' in $pentaho::manage_jdbc_drivers {

    package { 'mysql-connector-java' :
      ensure => installed,
    }->
    file { "${pentaho::applicationserver_base}/lib/mysql-connector-java.jar" :
      ensure => 'link',
      target => '/usr/share/java/mysql-connector-java.jar',
    }

  }

  if 'pgsql' in $pentaho::manage_jdbc_drivers {

    package { $pentaho::params::postgresql_jdbc_driver_package :
      ensure => installed,
    }->
    file { "${pentaho::applicationserver_base}/lib/postgresql-jdbc.jar" :
      ensure => 'link',
      target => '/usr/share/java/postgresql-jdbc.jar',
    }

  }

  if 'h2' in $pentaho::manage_jdbc_drivers {

    wget::fetch { 'h2.jar' :
      source      => $pentaho::h2driver_source_url,
      destination => "${pentaho::applicationserver_base}/lib/h2.jar",
      timeout     => 0,
      verbose     => false,
    }

  }

  archive { 'pentaho' :
    ensure           => present,
    extension        => 'zip',
    checksum         => false,
    follow_redirects => true,
    url              => $pentaho::pentaho_source_url,
    target           => $pentaho::temp_folder,
    src_target       => $pentaho::temp_folder,
    timeout          => 0,
  }

}
