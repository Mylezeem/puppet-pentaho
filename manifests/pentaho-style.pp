define pentaho::pentaho-style ($instance = $name,
$version,) {

  Exec {path => ['/usr/bin', '/bin'], require => [Class['git'], Class['tomcat6']],}
  exec {"git clone git://github.com/Spredzy/pentaho-style-${version}.git pentaho-style${name}" :
	  cwd    => '/var/lib/tomcat6/webapps/',
	  unless => "ls /var/lib/tomcat6/webapps/pentaho-style${name}",
  }
  exec {"refresh ${name} repo" :
	  command => 'git pull origin master',
	  cwd     => "/var/lib/tomcat6/webapps/pentaho-style${name}",
	  onlyif  => "ls /var/lib/tomcat6/webapps/pentaho-style${name}",
  }

  File{ ensure => present, require => [Exec["git clone git://github.com/Spredzy/pentaho-style-${version}.git pentaho-style${name}"], Exec["refresh ${name} repo"]],}
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/active/default.css" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/default.css"),
  }
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/pentaho.css" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/pentaho.css"),
  }
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/pentaho.js" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/pentaho.js"),
  }
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/deprecated.css" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/deprecated.css"),
  }
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/styles-new.css" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/styles-new.css"),
  }
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/WEB-INF/skins/winter.properties" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/winter.properties"),
  }
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/WEB-INF/skins/autumn.properties" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/autumn.properties"),
  }
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/WEB-INF/skins/pentaho-skin.properties" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/pentaho-skin.properties"),
  }
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/WEB-INF/skins/salsa.properties" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/salsa.properties"),
  }
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/WEB-INF/skins/white.properties" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/white.properties"),
  }
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/WEB-INF/classes/pentaho-skin.properties" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/pentaho-skin.properties"),
  }
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/images/themes/salsa/salsa.properties" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/salsa.properties"),
  }
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/images/themes/salsa/winter.properties" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/winter.properties"),
  }
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/tabview/css/grey_tabview.css" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/grey_tabview.css"),
  }
  file {"/var/lib/tomcat6/webapps/pentaho-style${name}/tabview/css/tab_content.css" :
	  content => template("pentaho/webapps/pentaho-style-${version}/pentaho-style/tab_content.css"),
  }
}
