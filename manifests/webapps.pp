define pentaho::webapps(
) {

	$h = get_dir_hash_path("${tmp_path}/${name}")
  create_resources('file', $h, {'ensure'	=> 'directory', 'owner' => 'root', 'group' => 'root', 'mode' => '0755'})

	exec {'copy pentaho-webapps' :
		cwd => '/',
		command => "cp -r ${tmp_path}/biserver-manual-ce-${version}-stable/biserver-manual-ce/pntaho-webapps ${tmp_path}/${name}/puppet_${name}",
		path => '/bin',
		unless => "ls ${webapps_path}/pentaho_${name}",
		require => File["${tmp_path}/${name}"],
	}


	File {
		ensure  => present,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
		require => Exec['copy pentaho-webapps'],
	}
	file {"${tmp_path}/${name}/puppet_${name}/META-INF" :
		ensure => directory,
	}

	file {"${tmp_path}/${name}/puppet_${name}/WEB-INF/web.xml" :
		content => template("puppet/${version}/webapps/WEB-INF/web.xml"),
	}

	file {"${tmp_path}/${name}/puppet_${name}/WEB-INF/classes/log4j.xml" :
		content => template("puppet/${version}/webapps/WEB-INF/classes/log4j.xml"),
	}

	file {"${tmp_path}/${name}/puppet_${name}/WEB-INF/classes/log4j.dtd" :
		content => template("puppet/${version}/webapps/WEB-INF/classes/log4j.dtd"),
	}

	file {"${tmp_path}/${name}/puppet_${name}/META-INF/context.xml" :
		content => template("puppet/${version}/webapps/META-INF/context.xml"),
	}

	file {"${tmp_path}/${name}/puppet_${name}/META-INF/MANIFEST.MF" :
		content => template("puppet/${version}/webapps/META-INF/MANIFEST.MF"),
	}

}
