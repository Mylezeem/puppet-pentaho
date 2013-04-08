# spec/defines/backend_spec.rb

require 'spec_helper'

describe 'pentaho::backend' do

	let(:title) { 'puppet' }

	let(:params) { {
		:version => '4.8.0',
		:tmp_path => '/tmp',
		:mysql_user => 'root',
		:mysql_pass => 'root',
	} }

	it 'run create_quartz_mysql.sql' do

		should contain_exec("mysql -uroot -proot < /tmp/biserver-manual-ce-4.8.0-stable/biserver-manual-ce/pentaho-data/create_quartz_mysql.sql").with({
				'cwd'     => '/',
				'command' =>  "mysql -uroot -proot < /tmp/biserver-manual-ce-4.8.0-stable/biserver-manual-ce/pentaho-data/create_quartz_mysql.sql",
				'path'    => '/usr/bin',
				'unless'  => 'mysql-uroot -proot -e "SHOW DATABASES" | grep "quartz"',
		})

	end

	it 'run create_repository_mysql.sql' do

		should contain_exec("mysql -uroot -proot < /tmp/biserver-manual-ce-4.8.0-stable/biserver-manual-ce/pentaho-data/create_repository_mysql.sql").with({
				'cwd'     => '/',
				'command' =>  "mysql -uroot -proot < /tmp/biserver-manual-ce-4.8.0-stable/biserver-manual-ce/pentaho-data/create_repository_mysql.sql",
				'path'    => '/usr/bin',
				'unless'  => 'mysql-uroot -proot -e "SHOW DATABASES" | grep "hibernate"',
		})

	end

	it 'run create_sample_datasource_mysql.sql (if asked)' do


		should contain_exec("mysql -uroot -proot < /tmp/biserver-manual-ce-4.8.0-stable/biserver-manual-ce/pentaho-data/create_sample_datasource_mysql.sql").with({
				'cwd'     => '/',
				'command' =>  "mysql -uroot -proot < /tmp/biserver-manual-ce-4.8.0-stable/biserver-manual-ce/pentaho-data/create_sample_datasource_mysql.sql",
				'path'    => '/usr/bin',
				'unless'  => 'mysql-uroot -proot -e "SHOW DATABASES" | grep "SampleData"',
		})

	end

end
