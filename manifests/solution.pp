define pentaho::solution (
	$solution_path,
	$tmp_path,
	$webapps_path,
	$version
) {

	validate_absolute_path($solution_path)
	validate_absolute_path($tmp_path)
	validate_absolute_path($webapps_path)
	validate_string($version)

	$h = get_dir_hash_path($solution_path)
  create_resources('file', $h, {'ensure'	=> 'directory', 'owner' => 'root', 'group' => 'root', 'mode' => '0755'})

	exec {'copy pentaho-solutions' :
		cwd => '/',
		path => '/bin',
		command => "cp -r ${tmp_path}/biserver-manual-ce-${version}-stable/biserver-manual-ce/pentaho-solutions ${solution_path}/pentaho_${name}/",
		unless => "ls ${solution_path}/pentaho_${name}",
	}

}
