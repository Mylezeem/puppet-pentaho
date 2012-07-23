define pentaho::role ($instance,
					  $dbtype,
					  $cmd,
					  $exe_sql) {

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
