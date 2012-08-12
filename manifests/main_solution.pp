define pentaho::main_solution ($instance,
$pentaho_solution,
$dbtype,
$user,
$pass,
$host,
$port,
$version,
$driver,
$dialect,
$delegate,
$cntstring,) {
	
  #
  # Getting the system and admin folders on a public repo (GitHub)
  #
  $to_git_path = pentaho_dirname($pentaho_solution)
  $pentaho_solution_folder_name = pentaho_basename($pentaho_solution)
  exec {"Get files Pentaho ${version} for  ${name}" :
	  cwd     => $to_git_path,
	  path    => ['/usr/bin', '/usr/sbin', '/bin'],
	  command => "git clone https://github.com/Spredzy/pentaho-solutions-${version}.git ${pentaho_solution_folder_name}",
	  timeout => 0,
	  unless  => "ls ${pentaho_solution}",
	  require => File[$to_git_path],
  }
  exec {"Deleting git file in ${name} pentaho solution folder" :
	  cwd     => $pentaho_solution,
	  path    => ['/usr/bin', '/usr/sbin', '/bin'],
	  command => 'rm -rf .git',
	  onlyif  => "ls ${pentaho_solution}",
	  require => Exec["Get files Pentaho ${version} for  ${name}"],
  }

  #
  # Configuring the database related file for hibernate
  #
  File { ensure => present, require => Exec["Deleting git file in ${name} pentaho solution folder"], }
  #
  # Authentication related files
  #
  file {"${pentaho_solution}/system/applicationContext-spring-security-hibernate.properties" :
	  content => template("pentaho/system/applicationContext-spring-security-hibernate-${version}.properties")
  }
  file {"${pentaho_solution}/system/applicationContext-spring-security-jdbc.xml" :
	  content => template("pentaho/system/applicationContext-spring-security-jdbc-${version}.xml"),
  }
  file {"${pentaho_solution}/system/hibernate/${dbtype}.hibernate.cfg.xml" :
	  content => template("pentaho/system/${dbtype}.hibernate.cfg-${version}.xml"),
  }
  file {"${pentaho_solution}/system/hibernate/hibernate-settings.xml" :
	  content => template("pentaho/system/hibernate-settings-${version}.xml"),
  }
  file {"${pentaho_solution}/system/quartz/quartz.properties" :
	  content => template("pentaho/system/quartz-${version}.properties"),
  }
  file {"${pentaho_solution}/system/simple-jndi/jdbc.properties" :
	  content => template("pentaho/system/jdbc.properties"),
  }

		#
		# Layout file patch
		#

	file {"${pentaho_solution}/bi-developers/reporting/steel-wheels-reports/Variance Report.xml" :
		content => template("pentaho/system/pentaho-style-${version}/Variance Report.xml"),
	}
	file {"${pentaho_solution}/bi-developers/reporting/steel-wheels-reports/variance_parameter_template.htm" :
		content => template("pentaho/system/pentaho-style-${version}/variance_parameter_template.htm"),
	}
	file {"${pentaho_solution}/bi-developers/reporting/parameter_template.html" :
		content => template("pentaho/system/pentaho-style-${version}/parameter_template.html"),
	}
	file {"${pentaho_solution}/bi-developers/reporting/dep-param/DependentParameterTemplate.html" :
		content => template("pentaho/system/pentaho-style-${version}/DependentParameterTemplate.html"),
	}
	file {"${pentaho_solution}/bi-developers/launch/launch.htm" :
		content => template("pentaho/system/pentaho-style-${version}/launch.htm"),
	}
	file {"${pentaho_solution}/bi-developers/launch/learn_more_designer.htm" :
		content => template("pentaho/system/pentaho-style-${version}/learn_more_designer.htm"),
	}
	file {"${pentaho_solution}/bi-developers/launch/learn_more_waqr.htm" :
		content => template("pentaho/system/pentaho-style-${version}/learn_more_waqr.htm"),
	}
	file {"${pentaho_solution}/system/ui/templates/viewActionErrorTemplate.html" : 
		content => template("pentaho/system/pentaho-style-${version}/viewActionErrorTemplate.html"),
	}
	file {"${pentaho_solution}/system/pentaho-cdf/template-dashboard.html" :
		content => template("pentaho/system/pentaho-style-${version}/template-dashboard.html"),
	}
	file {"${pentaho_solution}/system/pentaho-cdf/resources/style/active/default.css" : 
		content => template("pentaho/system/pentaho-style-${version}/default.css"),
	}
	file {"${pentaho_solution}/system/pentaho-cdf/template-dashboard-mantle.html" :
		content => template("pentaho/system/pentaho-style-${version}/template-dashboard-mantle.html"),
	}
	file {"${pentaho_solution}/system/custom/xsl/admin-mini.xsl" :
		content => template("pentaho/system/pentaho-style-${version}/admin-mini.xsl"),
	}
	file {"${pentaho_solution}/system/custom/xsl/files-util.xsl" :
		content => template("pentaho/system/pentaho-style-${version}/files-util.xsl"),
	}
	file {"${pentaho_solution}/system/custom/xsl/portal-files.xsl" :
		content => template("pentaho/system/pentaho-style-${version}/portal-files.xsl"),
	}
	file {"${pentaho_solution}/system/custom/xsl/xmlTree.xsl" :
		content => template("pentaho/system/pentaho-style-${version}/xmlTree.xsl"),
	}
	file {"${pentaho_solution}/system/custom/xsl/CustomReportParameters.xsl" :
		content => template("pentaho/system/pentaho-style-${version}/CustomReportParameters.xsl"),
	}
	file {"${pentaho_solution}/system/custom/xsl/adminToTreeView.xsl" :
		content => template("pentaho/system/pentaho-style-${version}/adminToTreeView.xsl"),
	}
	file {"${pentaho_solution}/system/custom/xsl/files-list.xsl" :
		content => template("pentaho/system/pentaho-style-${version}/files-list.xsl"),
	}
	file {"${pentaho_solution}/system/custom/xsl/DefaultParameterForm.xsl" :
		content => template("pentaho/system/pentaho-style-${version}/DefaultParameterForm.xsl"),
	}
	file {"${pentaho_solution}/system/custom/xsl/publishers-mini.xsl" :
		content => template("pentaho/system/pentaho-style-${version}/publishers-mini.xsl"),
	}
	file {"${pentaho_solution}/system/custom/xsl/files-icons.xsl" :
		content => template("pentaho/system/pentaho-style-${version}/files-icons.xsl"),
	}
	file {"${pentaho_solution}/system/custom/xsl/SubscriptionAdmin.xsl" :
		content => template("pentaho/system/pentaho-style-${version}/SubscriptionAdmin.xsl"),
	}
	file {"${pentaho_solution}/system/custom/xsl/DefaultParameterForm_1_7.xsl" :
		content => template("pentaho/system/pentaho-style-${version}/DefaultParameterForm_1_7.xsl"),
	}
	file {"${pentaho_solution}/system/custom/xsl/files-mini.xsl" :
		content => template("pentaho/system/pentaho-style-${version}/files-mini.xsl"),
	}
	file {"${pentaho_solution}/system/custom/xsl/ParameterFormUtil.xsl" :
		content => template("pentaho/system/pentaho-style-${version}/ParameterFormUtil.xsl"),
	}
	file {"${pentaho_solution}/system/custom/template.html" :
		content => template("pentaho/system/pentaho-style-${version}/template.html"),
	}
	file {"${pentaho_solution}/system/custom/template-document.html" :
		content => template("pentaho/system/pentaho-style-${version}/template-document.html"),
	}
	file {"${pentaho_solution}/system/custom/template-home-experimental.html" :
		content => template("pentaho/system/pentaho-style-${version}/template-home-experimental.html"),
	}
	file {"${pentaho_solution}/system/custom/template-home.html" :
		content => template("pentaho/system/pentaho-style-${version}/template-home.html"),
	}
	file {"${pentaho_solution}/system/custom/template-login.html" :
		content => template("pentaho/system/pentaho-style-${version}/template-login.html"),
	}
	file {"${pentaho_solution}/system/custom/template-experimental.html" :
		content => template("pentaho/system/pentaho-style-${version}/template-experimental.html"),
	}
	file {"${pentaho_solution}/system/custom/template-popup.html" :
		content => template("pentaho/system/pentaho-style-${version}/template-popup.html"),
	}
	file {"${pentaho_solution}/system/custom/template-dialog.html" :
		content => template("pentaho/system/pentaho-style-${version}/template-dialog.html"),
	}
	file {"${pentaho_solution}/system/custom/template-footer.html" :
		content => template("pentaho/system/pentaho-style-${version}/template-footer.html"),
	}

	if $version == "4.5.0" {
		file {"${pentaho_solution}/system/pentaho-cdf/template-dashboard-clean.html" :
			content => template("pentaho/system/pentaho-style-${version}/template-dashboard-clean.html"),
		}
		file {"${pentaho_solution}/system/reporting/reportviewer/reportviewer.css" :
			content => template("pentaho/system/pentaho-style-${version}/reportviewer.css"),
		}
		file {"${pentaho_solution}/system/common-ui/resources/web/instrumented/test/glasspanetest.html" :
			content => template("pentaho/system/pentaho-style-${version}/glasspanetest.html"),
		}
		file {"${pentaho_solution}/system/common-ui/resources/web/test/glasspanetest.html" :
			content => template("pentaho/system/pentaho-style-${version}/glasspanetest.html"),
		}

	} elsif $version == "3.8.0" {
		file {"${pentaho_solution}/steel-wheels/charts/flash_parameter_template.html" :
			content => template("pentaho/system/pentaho-style-${version}/flash_parameter_template.html"),
		}
		file {"${pentaho_solution}/steel-wheels/charts/parameter_template.html" :
			content => template("pentaho/system/pentaho-style-${version}/parameter_template.html"),
		}
	}
	
	file {
		"${pentaho_solution}/system/logs" :
			ensure  => directory,
			mode    => '0644',
			group   => 'tomcat',
			owner   => 'tomcat',
			recurse => true;
		"${pentaho_solution}/system/tmp" :
			ensure  => directory,
			mode    => '0644',
			group   => 'tomcat',
			owner   => 'tomcat',
			recurse => true;
	}
}	
