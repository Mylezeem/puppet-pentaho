define pentaho::backend(
	$tmp_path,
	$version,
	$mysql_user,
	$mysql_pass
) {

	validate_absolute_path($tmp_path)
	validate_string($version)
	validate_string($mysql_user)
	validate_string($mysql_pass)

	$h = get_dir_hash_path("${tmp_path}/${name}")
  create_resources('file', $h, {'ensure'	=> 'directory', 'owner' => 'root', 'group' => 'root', 'mode' => '0755'})

	file {"${tmp_path}/${name}/create_quartz_mysql.sql" :
		ensure  => present,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
		content => template("pentaho/${version}/data/mysql/create_quartz_mysql.sql"),
	}

	file {"${tmp_path}/${name}/create_repository_mysql.sql" :
		ensure  => present,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
		content => template("pentaho/${version}/data/mysql/create_repository_mysql.sql"),
	}

	file {"${tmp_path}/${name}/create_sample_datasource_mysql.sql" :
		ensure  => present,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
		content => template("pentaho/${version}/data/mysql/create_sample_datasource_mysql.sql"),
	}

	exec {'run create_quartz_mysql.sql' :
		cwd     => '/',
		path    => '/usr/bin',
		command => "mysql -u${mysql_user} -p${mysql_pass} < ${tmp_path}/${name}/create_quartz_mysql.sql",
		unless  => "mysql -u${mysql_user} -p${mysql_pass} -e 'SHOW DATABASES' | grep 'quartz_${name}'",
		require => File["${tmp_path}/${name}/create_quartz_mysql.sql"],
		before  => File['remove templ folder'],
	}

	exec {'run create_repository_mysql.sql' :
		cwd     => '/',
		path    => '/usr/bin',
		command => "mysql -u${mysql_user} -p${mysql_pass} < ${tmp_path}/${name}/create_repository_mysql.sql",
		unless  => "mysql -u${mysql_user} -p${mysql_pass} -e 'SHOW DATABASES' | grep 'hibernate_${name}'",
		require => File["${tmp_path}/${name}/create_repository_mysql.sql"],
		before  => File['remove templ folder'],
	}

	exec {'run create_sample_datasource_mysql.sql' :
		cwd     => '/',
		path    => '/usr/bin',
		command => "mysql -u${mysql_user} -p${mysql_pass} < ${tmp_path}/${name}/create_sample_datasource_mysql.sql",
		require => File["${tmp_path}/${name}/create_sample_datasource_mysql.sql"],
		before  => File['remove templ folder'],
	}

	file {'remove temp folder' :
		ensure => absent,
		path   => "${tmp_path}/${name}",
	}

}
