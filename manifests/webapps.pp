define pentaho::webapps() {

	$hsql_extra_1 = ''
	$hsql_extra_2 = ''

	exec {"git clone git://github.com/Spredzy/pentaho.git pentaho_${name}" :
		cwd     =>  "/tmp/pentaho_${name}",
		path    =>  ["/usr/bin", "/bin"],
		unless  =>  "ls -la /tmp/pentaho_${name}/pentaho_${name}",
		require => File ["/tmp/pentaho_${name}"],
	}

	exec {"update ${name} pentaho" :
		command =>  "git pull origin master",
		cwd     =>  "/tmp/pentaho_${name}/pentaho_${name}",
		path    =>  ["/usr/bin", "/bin"],
		onlyif  =>  "ls -la /tmp/pentaho_${name}/pentaho_${name}",
		require => File ["/tmp/pentaho_${name}"],
	}

	file {"/tmp/pentaho_${name}/pentaho_${name}/META-INF/context.xml" :
		ensure  => present,
		content =>  template('pentaho/webapps/context.xml'),
		require =>  [Exec["git clone git://github.com/Spredzy/pentaho.git pentaho_${name}"], Exec["update ${name} pentaho"]],
	}

   file {"/tmp/pentaho_${name}/pentaho_${name}/WEB-INF/classes/log4j.xml" :
		ensure  => present,
		content =>  template('pentaho/webapps/log4j.xml'),
		require =>  File["/tmp/pentaho_${name}/pentaho_${name}/META-INF/context.xml"],
	}

    file {"/tmp/pentaho_${name}/pentaho_${name}/WEB-INF/web.xml" :
		ensure  => present,
		content =>  template('pentaho/webapps/web.xml'),
		require =>  File["/tmp/pentaho_${name}/pentaho_${name}/WEB-INF/classes/log4j.xml"],
	}

	file{"${log_path}/pentaho_${name}" :
		ensure => directory,
	}

}
