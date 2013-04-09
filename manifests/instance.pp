define pentaho::instance (
		$solution_path,
		$log_path,
		$tmp_path = '/tmp',
		$webapps_path = '/usr/share/tomcat7/webapps',
		$version = '4.8',
		$instance_name = $name,
		) {

		require pentaho

		validate_string($instance_name)
		validate_absolute_path($solution_path)
		validate_absolute_path($log_path)
		validate_absolute_path($webapps_path)
		validate_string($version)

		$url = "http://sourceforge.net/projects/pentaho/files/Business%20Intelligence%20Server/${version}.0-stable/biserver-manual-ce-${version}.0-stable.zip/download"

	$h = get_dir_hash_path("${tmp_path}/${name}")
  create_resources('file', $h, {'ensure'	=> 'directory', 'owner' => 'root', 'group' => 'root', 'mode' => '0755', 'before' => Pentaho::Download[$version]})

	pentaho::download {$version :
		pentaho_instance => "${webapps_path}/pentaho_${instance_name}",
										 url => $url,
										 version => "${version}.0",
										 tmp_path => '/tmp',
	} ->
	pentaho::solution { $instance_name :
		solution_path => $solution_path,
									tmp_path => '/tmp',
									webapps_path => $webapps_path,
									version => "${version}.0"
	} ->
	pentaho::backend { $instance_name :
		tmp_path => '/tmp',
						 version  => "${version}.0",
						 mysql_user => 'root',
						 mysql_pass => 'root',
	} ->
	pentaho::webapps { $instance_name :
		tmp_path => '/tmp',
						 version => "${version}.0",
						 log_path => $log_path,
						 solution_path => $solution_path,
						 webapps_path => $webapps_path,
	}



}
