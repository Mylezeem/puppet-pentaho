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

		should contain_exec('run create_quartz_mysql.sql').with({
				'cwd'     => '/',
				'command' => 'mysql -uroot -proot < /tmp/puppet/create_quartz_mysql.sql',
				'path'    => '/usr/bin',
				'unless'  => 'mysql -uroot -proot -e \'SHOW DATABASES\' | grep \'quartz_puppet\'',
		})

	end

	it 'run create_repository_mysql.sql' do

		should contain_exec('run create_repository_mysql.sql').with({
				'cwd'     => '/',
				'command' => 'mysql -uroot -proot < /tmp/puppet/create_repository_mysql.sql',
				'path'    => '/usr/bin',
				'unless'  => 'mysql -uroot -proot -e \'SHOW DATABASES\' | grep \'hibernate_puppet\'',
		})

	end

	it 'run create_sample_datasource_mysql.sql (if asked)' do

		should contain_exec('run create_sample_datasource_mysql.sql').with({
				'cwd'     => '/',
				'command' =>  'mysql -uroot -proot < /tmp/puppet/create_sample_datasource_mysql.sql',
				'path'    => '/usr/bin',
		})

	end

end
