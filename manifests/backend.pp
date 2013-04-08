define pentaho::backend(
) {


	$h = get_dir_hash_path("${tmp_path}/${name}")
	create_resource

	file {"${tmp_path}/${name}/create_quartz_mysql.sql" :
		ensure  => present,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
		content => template("pentaho/${version}/data/create_quartz_mysql.sql"),
	}

	file {"${tmp_path}/${name}/create_repository_mysql.sql" :
		ensure  => present,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
		content => template("pentaho/${version}/data/create_repository_mysql.sql"),
	}

	file {"${tmp_path}/${name}/create_sample_datasource_mysql.sql" :
		ensure  => present,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
		content => template("pentaho/${version}/data/create_sample_datasource_mysql.sql"),
	}

	exec {'run create_quartz_mysql.sql' :
		cwd     => '/',
		path    => '/usr/bin',
		command => "mysql -u${user} -p${password} < ${tmp_path}/${name}/create_quartz_mysql.sql",
		unless  => "mysql -u${user} -p${path} -e 'SHOW DATABASES' | grep 'quartz_${name}'"
		require => File["${tmp_path}/${name}/create_quartz_mysql.sql"],
		before  => File['remove templ folder'],
	}

	exec {'run create_repository_mysql.sql' :
		cwd     => '/',
		path    => '/usr/bin',
		command => "mysql -u${user} -p${password} < ${tmp_path}/${name}/create_repository_mysql.sql",
		unless  => "mysql -u${user} -p${path} -e 'SHOW DATABASES' | grep 'repository_${name}'"
		require => File["${tmp_path}/${name}/create_repository_mysql.sql"],
		before  => File['remove templ folder'],
	}

	exec {'run create_sample_datasource_mysql.sql' :
		cwd     => '/',
		path    => '/usr/bin',
		command => "mysql -u${user} -p${password} < ${tmp_path}/${name}/create_sample_datasource_mysql.sql",
		unless  => "mysql -u${user} -p${path} -e 'SHOW DATABASES' | grep 'sample_datasource_${name}'"
		require => File["${tmp_path}/${name}/create_sample_datasource_mysql.sql"],
		before  => File['remove templ folder'],
	}

	file {'remove temp folder' :
		ensure => absent,
		path   => "${tmp_path}/${name}",
	}

}
