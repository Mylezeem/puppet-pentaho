# spec/defines/solution_spec.rb

require 'spec_helper'

describe 'pentaho::solution' do

	let(:title) { 'puppet' }

	let(:params) { {
		:solution_path => '/opt/pentaho',
		:tmp_path => '/tmp',
		:webapps_path => '/usr/share/tomcat7/webapps',
		:version => '4.8.0',
	} }

#it 'Create the tree of neccesary directory to host pentaho solution folder' do

#		should contain_file('/opt/pentaho').with({
#				'ensure' => 'directory',
#				'owner'  => 'root',
#		'group'  => 'root',
#				'mode'   => '0755',
#		})

#	end

	it 'Copy the directory from the downloaded archive to its accurate location' do
		
		should contain_exec('copy pentaho-solutions').with({
			'command' => 'cp -r /tmp/biserver-manual-ce-4.8.0-stable/biserver-manual-ce/pentaho-solutions /opt/pentaho/pentaho_puppet/',
			'cwd'     => '/',
			'path'    => '/bin',
			'unless'  => 'ls /opt/pentaho/pentaho_puppet',
		})

	end

	

end
