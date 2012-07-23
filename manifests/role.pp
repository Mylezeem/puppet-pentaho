define pentaho::role ($dbtype) {

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

	$pentaho_role = remove_instance_name($name, $instance)
	$desc = hiera('description')

	$insert_string = $dbtype ? {
		/(mysql|mysql5)/		=>	"INSERT INTO AUTHORITIES VALUES('${pentaho_role}', '${desc}') ON DUPLICATE KEY UPDATE DESCRIPTION = '${desc}'",
		default					=> 	"INSERT INTO AUTHORITIES VALUES('${pentaho_role}', '${desc}')",
	}

	exec {"${cmd} hibernate${instance} $exe_sql \"${insert_string}\"" :
		cwd		=> '/',
		path	=> ["/usr/bin", "/bin"],
		require	=> Pentaho::Backend["${instance}"],
	}
}
