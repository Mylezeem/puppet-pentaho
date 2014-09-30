require 'spec_helper'

describe 'pentaho::database' do

  let (:facts) {{ :osfamily => 'RedHat' }}

  describe 'load databases' do
  
    context 'mysql' do

      let :pre_condition do
        "class { 'pentaho': }"
      end

      it { is_expected.to contain_file('/var/tmp/quartz.sql').with_source('puppet:///modules/pentaho/5.1/mysql/create_quartz.sql') }

      it { is_expected.to contain_mysql__db('quartz').with_user('pentaho_user') }
      it { is_expected.to contain_mysql__db('quartz').with_password('password') }
      it { is_expected.to contain_mysql__db('quartz').with_charset('utf8') }
      it { is_expected.to contain_mysql__db('quartz').with_collate('utf8_general_ci') }
      it { is_expected.to contain_mysql__db('quartz').with_sql('/var/tmp/quartz.sql') }

      it { is_expected.to contain_mysql__db('repository').with_user('hibuser') }
      it { is_expected.to contain_mysql__db('repository').with_password('password') }
      it { is_expected.to contain_mysql__db('repository').with_charset('utf8') }
      it { is_expected.to contain_mysql__db('repository').with_collate('utf8_general_ci') }

      it { is_expected.to contain_mysql__db('jackrabbit').with_user('jcr_user') }
      it { is_expected.to contain_mysql__db('jackrabbit').with_password('password') }
      it { is_expected.to contain_mysql__db('jackrabbit').with_charset('utf8') }
      it { is_expected.to contain_mysql__db('jackrabbit').with_collate('utf8_general_ci') }
    end

  end


end
