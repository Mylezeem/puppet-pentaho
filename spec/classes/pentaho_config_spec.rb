require 'spec_helper'

describe 'pentaho::config' do

  let (:facts) {{ :osfamily => 'RedHat' }}

  describe 'configure hibernate-settings.xml' do

    let :pre_condition do
      "class { 'pentaho': }"
    end

    it { is_expected.to contain_augeas('config_file').with_lens('Xml.lns') }
    it { is_expected.to contain_augeas('config_file').with_incl('/opt/pentaho/pentaho-solutions/system/hibernate/hibernate-settings.xml') }
    context 'mysql' do
      it { is_expected.to contain_augeas('config_file').with_changes('set settings/config-file/#text system/hibernate/mysql5.hibernate.cfg.xml') }
    end

    context 'postgresql' do
      let :pre_condition do
        "class { 'pentaho':
           db_type => 'pgsql',
         }"
      end

      it { is_expected.to contain_augeas('config_file').with_changes('set settings/config-file/#text system/hibernate/postgresql.hibernate.cfg.xml') }
    end

  end

  describe 'configure quartz.properties' do

    let :pre_condition do
      "class { 'pentaho': }"
    end

    it { is_expected.to contain_augeas('quartz_properties').with_lens('simplevars.lns') }
    it { is_expected.to contain_augeas('quartz_properties').with_incl('/opt/pentaho/pentaho-solutions/system/quartz/quartz.properties') }

    context 'mysql' do
      it { is_expected.to contain_augeas('quartz_properties').with_changes('set org.quartz.jobStore.driverDelegateClass org.quartz.impl.jdbcjobstore.StdJDBCDelegate') }
    end

    context 'postgresql' do
      let :pre_condition do
        "class { 'pentaho':
           db_type => 'pgsql',
         }"
      end

      it { is_expected.to contain_augeas('quartz_properties').with_changes('set org.quartz.jobStore.driverDelegateClass org.quartz.impl.jdbcjobstore.PostgreSQLDelegate') }
    end

  end

  describe 'configure jackrabbit' do

    let :pre_condition do
      "class { 'pentaho': }"
    end

    it { is_expected.to contain_file('/opt/pentaho/pentaho-solutions/system/jackrabbit/repository.xml') }

  end

  describe 'move pentaho archive to $pentaho_solution' do

    let :pre_condition do
      "class { 'pentaho': }"
    end

    it { is_expected.to contain_exec('/bin/mkdir -p /opt/pentaho').with_unless('/usr/bin/stat /opt/pentaho') }
    it { is_expected.to contain_exec('/bin/cp -r /var/tmp/biserver-ce/pentaho-solutions /opt/pentaho').with_unless('/usr/bin/stat /opt/pentaho/pentaho-solutions') }

  end

  describe 'configure proper permission on specific folders' do

    let :pre_condition do
      "class { 'pentaho': }"
    end


    ['/opt/pentaho/pentaho-solutions/system/osgi', '/opt/pentaho/pentaho-solutions/system/logs', '/opt/pentaho/pentaho-solutions/system/logs/audit','/opt/pentaho/pentaho-solutions/system/jackrabbit', '/var/log/pentaho'].each do |file|

      it { is_expected.to contain_file(file).with_ensure('directory') }
      it { is_expected.to contain_file(file).with_owner('tomcat') }
      it { is_expected.to contain_file(file).with_group('tomcat') }
      it { is_expected.to contain_file(file).with_mode('0755') }

    end

  end

end
