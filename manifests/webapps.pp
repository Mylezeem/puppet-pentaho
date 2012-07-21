define pentaho::webapps() {

	$instance = $name
	$pentaho_solution = hiera('pentaho_solution')
	$dbtype = hiera('dbtype')
	$port = hiera('port')

	if $dbtype == "hsql" {
		$hsql_extra_1 = "<context-param>
							<param-name>hsqldb-databases</param-name>
							<param-value>sampledata${instance}@${hsqldb_path}/${instance}/sampledata${instance},hibernate${instance}@${hsqldb_path}/${instance}/hibernate${instance},quartz${instance}@${hsqldb_path}/${instance}/quartz${instance}</param-value>
						</context-param>
						<context-param>
							<param-name>hsqldb-port</param-name>
					        <param-value>${port}</param-value>
						</context-param>"

		$hsql_extra_2 = "<listener>
							<listener-class>org.pentaho.platform.web.http.context.HsqldbStartupListener</listener-class>
						</listener>"
		$validationQuery = "select count(*) from INFORMATION_SCHEMA.SYSTEM_SEQUENCES"
	} else {
		$hsql_extra_1 = ""
		$hsql_extra_2 = ""
		$validationQuery = "select 1"
	}


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

	file{"${log_path}/pentaho_${name}" :
		ensure => directory,
		mode => '0777',
		recurse => true,
	}

   file {"/tmp/pentaho_${name}/pentaho_${name}/WEB-INF/classes/log4j.xml" :
		ensure  => present,
		content =>  template('pentaho/webapps/log4j.xml'),
		require =>  [File["/tmp/pentaho_${name}/pentaho_${name}/META-INF/context.xml"], File["${log_path}/pentaho_${name}"]],
	}

    file {"/tmp/pentaho_${name}/pentaho_${name}/WEB-INF/web.xml" :
		ensure  => present,
		content =>  template('pentaho/webapps/web.xml'),
		require =>  File["/tmp/pentaho_${name}/pentaho_${name}/WEB-INF/classes/log4j.xml"],
	}


	exec {"mv /tmp/pentaho_${name}/pentaho_${name} /var/lib/tomcat6/webapps/" :
		cwd		=> "/tmp",
		path	=> ["/usr/bin", "/bin", "/usr/sbin"],
		unless  => "ls /var/lib/tomcat6/webapps/pentaho_${name}",
		require =>  File["/tmp/pentaho_${name}/pentaho_${name}/WEB-INF/web.xml"],
	}

}
