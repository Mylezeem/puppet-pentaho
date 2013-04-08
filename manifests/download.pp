define pentaho::download (
	$pentaho_instance,
	$url,
	$version,
	$tmp_path) {

	validate_absolute_path($pentaho_instance)
	validate_absolute_path($tmp_path)
	validate_string($url)

	
	#url = uriescape($url)

	exec {"download pentaho ${version}" :
		cwd => '/',
		command => "wget -O ${tmp_path}/biserver-manual-ce-${version}-stable.zip ${url}",
		path => '/usr/bin',
		timeout => 0,
		unless => "ls ${pentaho_instance}",
	}

	exec {"unzip pentaho ${version}" :
		cwd => "${tmp_path}",
		command => "unzip biserver-manual-ce-${version}-stable.zip -d biserver-manual-ce-${version}-stable",
		path => '/usr/bin',
		unless => "ls ${pentaho_instance}",
		require => Exec["download pentaho ${version}"],
	}

	exec {"remove biserver-manual-ce-${version}-stable.zip" :
		cwd => "${tmp_path}",
		command => "rm biserver-manual-ce-${version}-stable.zip",
		path => '/bin',
		unless => "ls ${pentaho_instance}",
		require => Exec["unzip pentaho ${version}"],
	}


}
