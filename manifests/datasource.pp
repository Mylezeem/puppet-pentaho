define pentaho::datasource($instance,
						   $dbtype,
						   $user,
						   $pass,
						   $ip,
						   $port,
						   $driver,
						   $cntstring,
						   $max_conn = 30,
						   $idle = 10,
						   $query = "SELECT 1",
						   $max_wait = 10000) {

	$cmd = $dbtype ? {
		/(mysql|mysql5)/		=>	"mysql -u${user} -p${pass} -h${ip} ",
		'postgresql'			=>	"psql -U ${user} -W ${pass} -h ${ip} ",
		/(oracle|oracle10g)/	=>	undef,
		default					=>	undef,
	}


	$exe_sql = $dbtype ? {
		/(mysql|mysql5)/		=>	"-e",
		'postgresql'			=>	"-c",
		/(oracle|oracle10g)/	=>	undef,
		default					=>	undef,
	}

	$pentaho_datasource = remove_instance_name($name, $instance)
	$ds_user = hiera('user')
	$ds_pass = pentaho_base64(hiera('password'))
	$ds_host = hiera('host')
	$ds_port = hiera('port')
	$ds_db = hiera('db') 
	$ds_options = stringify_array(hiera_array('options'), '&')

	$ds_insert_string = $dbtype ? {
		/(mysql|mysql5)/		=>	 "INSERT INTO DATASOURCE VALUES ('${pentaho_datasource}', ${max_conn}, '${driver}', ${idle}, '${ds_user}', '${ds_pass}', '${cntstring}${ds_host}:${ds_port}/${ds_db}?${ds_options}', '${query}', ${max_wait}) ON DUPLICATE KEY UPDATE MAXACTCONN = ${max_conn}, DRIVERCLASS = '${driver}', IDLECONN = ${idle}, USERNAME = '${ds_user}', PASSWORD = '${ds_pass}', URL = '${cntstring}${ds_host}:${ds_port}/${ds_db}?${ds_options}', QUERY = '${query}', WAIT = ${max_wait}",
		default					=>  "INSERT INTO DATASOURCE VALUES ('${pentaho_datasource}', ${max_conn}, '${driver}', ${idle}, '${ds_user}', '${ds_pass}', '${cntstring}${ds_host}:${ds_port}/${ds_db}?${ds_options}', '${query}', ${max_wait})",
	}

	exec {"${cmd} hibernate${instance} ${exe_sql} \"${ds_insert_string}\"" :
		cwd		=> '/',
		path	=> ["/usr/bin", "/bin"],
		require	=> Pentaho::Backend["${instance}"],
	}

	
}
