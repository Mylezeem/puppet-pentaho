# spec/defines/download_spec.rb

require 'spec_helper'

describe 'pentaho::download' do

	let(:title) { '4.8.0' }

	let(:params) { {
		:version => '4.8.0',
		:tmp_path => '/tmp',
		:pentaho_instance => '/usr/share/tomcat7/webapps/pentaho_puppet',
		:url => 'http://sourceforge.net/projects/pentaho/files/Business%20Intelligence%20Server/4.8.0-stable/biserver-manual-ce-4.8.0-stable.zip/download',
	} }


		it 'Download the biserver-manual-ce-4.8.0-stable archive' do
			
			should contain_exec('download pentaho 4.8.0').with({
					'cwd'     => '/',
					'command' => 'wget -O /tmp/biserver-manual-ce-4.8.0-stable.zip http://sourceforge.net/projects/pentaho/files/Business%20Intelligence%20Server/4.8.0-stable/biserver-manual-ce-4.8.0-stable.zip/download',
					'timeout' => 0,
					'path'    => '/usr/bin',
					'unless'  => 'ls /usr/share/tomcat7/webapps/pentaho_puppet',
			})

		end

		it 'Unzip the content of biserver-manual-ce-4.8.0-stable archive' do
			
			should contain_exec('unzip pentaho 4.8.0').with({
					'cwd' => '/tmp',
					'command' => 'unzip biserver-manual-ce-4.8.0-stable.zip -d biserver-manual-ce-4.8.0-stable',
					'path' => '/usr/bin',
					'unless'  => 'ls /usr/share/tomcat7/webapps/pentaho_puppet',
					'require' => 'Exec[download pentaho 4.8.0]',
			})

		end

		it 'Remove the biserver-manual-ce-4.8.0-stable archive' do

			should contain_exec('remove biserver-manual-ce-4.8.0-stable.zip').with({
					'cwd' => '/tmp',
					'command' => 'rm biserver-manual-ce-4.8.0-stable.zip',
					'path' => '/bin',
					'unless'  => 'ls /usr/share/tomcat7/webapps/pentaho_puppet',
					'require' => 'Exec[unzip pentaho 4.8.0]',
			})

		end

end
