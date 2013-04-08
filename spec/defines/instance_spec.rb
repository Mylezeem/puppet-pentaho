# spec/defines/instance_spec.rb

require 'spec_helper'

describe 'pentaho::instance' do

	context 'Entreprise Linux based' do

		let(:title) { 'puppet' }

		let(:facts) { {
			:osfamily => 'RedHat',
		} }

		let(:params) { {
			:version => '3.8',
			:solution_path => '/opt',
			:log_path => '/var/log/pentaho',
			:webapps_path => '/usr/share/tomcat7/webapps',
			:instance_name => 'puppet',
		} }


	end

	context 'Debian based' do

		let(:title) { 'puppet' }

		let(:facts) { {
			:osfamily => 'Debian',
		} }

		let(:params) { {
			:version => '3.8',
			:solution_path => '/opt',
			:log_path => '/var/log/pentaho',
			:webapps_path => '/usr/share/tomcat7/webapps',
			:instance_name => 'puppet',
		} }

		

	end

end
