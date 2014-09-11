class pentaho::setup {

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
      source      => 'http://repo2.maven.org/maven2/com/h2database/h2/1.4.181/h2-1.4.181.jar',
      destination => "${pentaho::applicationserver_base}/lib/h2-1.4.181.jar",
      timeout     => 0,
      verbose     => false
    }

  }

  archive { 'pentaho' :
    ensure           => present,
    extension        => 'zip',
    checksum         => false,
    follow_redirects => true,
    url              => 'http://downloads.sourceforge.net/project/pentaho/Business%20Intelligence%20Server/5.1/biserver-ce-5.1.0.0-752.zip?r=&ts=1410402175&use_mirror=iweb',
    target           => '/tmp',
    src_target       => '/tmp',
    timeout          => 0,
  }

}
