define pentaho::user ($instance,
					  $dbtype,
					  $cmd,
					  $exe_sql) {

	#
	# Getting the user relative information to be inserted.
	#

	$pentaho_user = remove_instance_name($name, $instance)
	$b64pass = pentaho_base64(hiera('password'))
	$desc = hiera('description')
	$enabled = hiera('enabled')

	$insert_string = $dbtype ? {
		/(mysql|mysql5)/		=>	"INSERT INTO USERS (USERNAME,PASSWORD,DESCRIPTION,ENABLED) VALUES('${pentaho_user}', '${b64pass}', '${desc}', '${enabled}') ON DUPLICATE KEY UPDATE PASSWORD='${b64pass}', ENABLED = '${enabled}', DESCRIPTION = '${desc}'",
		default					=>	"INSERT INTO USERS (USERNAME,PASSWORD,DESCRIPTION,ENABLED) VALUES('${pentaho_user}', '${b64pass}', '${desc}', '${enabled}')",
	}

	exec {"${cmd} hibernate${instance} ${exe_sql} \"${insert_string}\"" :
		cwd		=> '/',
		path	=> ["/usr/bin", "/bin"],
		require	=> Pentaho::Backend["${instance}"],
	}

	$pentaho_role = hiera_array('role')
	$insert_strings = build_insert_userrole_string($pentaho_role, $pentaho_user, $cmd, $instance, $exe_sql)

	exec{ $insert_strings :
		cwd => '/',
		path =>["/usr/bin", "/bin"],
		require	=> Pentaho::Backend["${instance}"],
	}
}

