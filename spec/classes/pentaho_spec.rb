# spec/classes/pentaho_spec.rb

require 'spec_helper'

describe 'pentaho' do

	context 'Entreprise Linux based' do

		let(:facts) { {
			:osfamily => 'RedHat',
		} }

	  it 'includes tomcat7' do
			should contain_class('tomcat7')
	  end

	  it 'includes mysql' do
	    should contain_class('mysql')
	  end

	end

	context 'Debian based' do

		let(:facts) { {
			:osfamily => 'Debian',
		} }

	  it 'includes tomcat7' do
			should contain_class('tomcat7')
	  end

	  it 'includes mysql' do
	    should contain_class('mysql')
	  end

	end

end

