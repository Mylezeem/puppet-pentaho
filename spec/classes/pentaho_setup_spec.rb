require 'spec_helper'

describe 'pentaho::setup' do

  let (:facts) {{ :osfamily => 'RedHat' }}

  describe 'jdbc drivers installation' do
  
    context 'mysql-connector' do
      let :pre_condition do
        "class { 'pentaho':
         manage_jdbc_drivers => ['h2', 'mysql'] }"
      end

      it { is_expected.to contain_package('mysql-connector-java') }

    end

    context 'postgresql-jdbc' do
      let :pre_condition do
        "class { 'pentaho':
         manage_jdbc_drivers => ['h2', 'pgsql'] }"
      end

      it { is_expected.to contain_package('postgresql-jdbc') }
    end

    context 'h2-jdbc' do
      let :pre_condition do
        "class { 'pentaho':
         manage_jdbc_drivers => ['h2', 'mysql'] }"
      end

      it { is_expected.to contain_wget__fetch('h2.jar') }
    end

  end

  describe 'pentaho archive download' do
    let :pre_condition do
      "class { 'pentaho': }"
    end

    it { is_expected.to contain_archive('pentaho').with_timeout('0') }
    it { is_expected.to contain_archive('pentaho').with_follow_redirects(true) }
    it { is_expected.to contain_archive('pentaho').with_ensure('present') }
    it { is_expected.to contain_archive('pentaho').with_extension('zip') }
    it { is_expected.to contain_archive('pentaho').with_timeout('0') }

    context 'with default parameters' do
    
      it { is_expected.to contain_archive('pentaho').with_target('/var/tmp') }
      it { is_expected.to contain_archive('pentaho').with_src_target('/var/tmp') }
      it { is_expected.to contain_archive('pentaho').with_url('http://downloads.sourceforge.net/project/pentaho/Business%20Intelligence%20Server/5.1/biserver-ce-5.1.0.0-752.zip?r=&ts=1410402175&use_mirror=iweb') }

    end

    context 'with custom source url' do
      let :pre_condition do
        "class { 'pentaho':
           temp_folder        => '/tmp',
           pentaho_source_url => 'http://foo.bar'
         }"
      end

      it { is_expected.to contain_archive('pentaho').with_target('/tmp') }
      it { is_expected.to contain_archive('pentaho').with_src_target('/tmp') }
      it { is_expected.to contain_archive('pentaho').with_url('http://foo.bar') }

    end

  end

end
