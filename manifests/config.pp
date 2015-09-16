# == Class: pentaho::config


class pentaho::config {

  # JOE
	if $::osfamily == 'Windows' {
	  $exec_provider = 'cygwin'
	} else { 
	  $exec_provider = 'posix'
	}
  
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  exec { "/bin/mkdir -p ${pentaho::pentaho_solutions_path}" :
    # TODO: I added command when I error trialed. JOE
    command => "/bin/mkdir -p ${pentaho::pentaho_solutions_path}",
    unless => "/usr/bin/stat ${pentaho::pentaho_solutions_path}",
    provider    => $exec_provider,
  } ->
  # I get this errors for some reason on one Windows server:
	# Notice: /Stage[main]/Pentaho::Config/Exec[/bin/cp -r 'c:/Temp/biserver-ce/pentaho-solutions' 'e:/Fast2/pentaho']/returns: /bin/cp: cannot stat ΓÇÿc:/Temp/biserver-ce/pentaho-solutionsΓÇÖ: No such file or directory
	exec { "/bin/cp -r '${pentaho::temp_folder}/biserver-ce/pentaho-solutions' '${pentaho::pentaho_solutions_path}'": 
    unless => "/usr/bin/stat '${pentaho::pentaho_solutions_path}/pentaho-solutions'",
    provider    => $exec_provider,
  }
  
  if !$pentaho::install_samples {
		# Remove samples.
		file { "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/default-content/samples.zip":
			ensure => absent,
			subscribe => Exec["/bin/cp -r '${pentaho::temp_folder}/biserver-ce/pentaho-solutions' '${pentaho::pentaho_solutions_path}'"],
		}		
  }
  
  Augeas {
    require => Exec["/bin/cp -r '${pentaho::temp_folder}/biserver-ce/pentaho-solutions' '${pentaho::pentaho_solutions_path}'"],
  }
  # Specify the hibernate file to use
  $hibernate_file = $pentaho::db_type ? {
    'mysql' => 'mysql5.hibernate.cfg.xml',
    'pgsql' => 'postgresql.hibernate.cfg.xml',
  }
  unless $::osfamily == 'Windows' {
	  augeas { 'config_file' :
	    lens    => 'Xml.lns',
	    incl    => "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/hibernate/hibernate-settings.xml",
	    changes => [
	      "set settings/config-file/#text system/hibernate/${hibernate_file}",
	    ],
	  }  
  }

  # Specify delegate class
  $delegate_class = $pentaho::db_type ? {
    'mysql' => 'org.quartz.impl.jdbcjobstore.StdJDBCDelegate',
    'pgsql' => 'org.quartz.impl.jdbcjobstore.PostgreSQLDelegate',
  }

  unless $::osfamily == 'Windows' {
	  augeas { 'quartz_properties' :
	    lens    => 'simplevars.lns',
	    incl    => "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/quartz/quartz.properties",
	    changes => [
	      "set org.quartz.jobStore.driverDelegateClass ${delegate_class}",
	    ],
	  }
  }
  
  File {
    require => Exec["/bin/cp -r '${pentaho::temp_folder}/biserver-ce/pentaho-solutions' '${pentaho::pentaho_solutions_path}'"],
  }

  file { "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/jackrabbit/repository.xml" :
    ensure  => file,
    content => template("pentaho/jackrabbit/${pentaho::db_type}/repository.xml.erb"),
  }

  # TODO (spredzy) : Currently use template but final goal
  #                  is to use augeas currently hitting bug
  #                  https://github.com/hercules-team/augeas/pull/158
  file { "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/osgi/log4j.xml" :
    ensure  => file,
    content => template('pentaho/log4j/log4j_osgi.xml.erb'),
  }

  unless $::osfamily == 'Windows' {
	  # Fixing incorrect permissions
	  $directories = ["${pentaho::pentaho_solutions_path}/pentaho-solutions/system/osgi", "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/logs", "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/logs/audit", "${pentaho::pentaho_solutions_path}/pentaho-solutions/system/jackrabbit", $pentaho::log_directory]
	
	  # For settings advanced Windows permissions you need the acl module. http://stackoverflow.com/questions/25087069/puppet-and-windows-directory-permissions
	  file { $directories :
	    ensure => directory,
	    owner  => $pentaho::applicationserver_user,
	    group  => $pentaho::applicationserver_group,
	    # Group need write support because else the Puppet agent wont be able to create subdirectories. JOE
	    # mode   => '0775',
	    mode   => '0755',
	    
	  }
  }

}
