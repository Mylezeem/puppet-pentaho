require 'spec_helper'

describe 'pentaho::webapp' do

  let (:facts) {{
    :osfamily  => 'RedHat',
    :ipaddress => '10.0.0.1'
  }}

  describe 'configure base_solution' do

    let :pre_condition do
      "class { 'pentaho': }"
    end

    it { is_expected.to contain_augeas('base_solution').with_lens('Xml.lns') }
    it { is_expected.to contain_augeas('base_solution').with_incl('/usr/share/tomcat/webapps/pentaho/WEB-INF/web.xml') }
    it { is_expected.to contain_augeas('base_solution').with_changes('set web-app/context-param[1]/param-value/#text /opt/pentaho/pentaho-solutions') }

  end

  describe 'configure listen_address' do

    let :pre_condition do
      "class { 'pentaho': }"
    end


    it { is_expected.to contain_augeas('listen_address').with_lens('Xml.lns') }
    it { is_expected.to contain_augeas('listen_address').with_incl('/usr/share/tomcat/webapps/pentaho/WEB-INF/web.xml') }

    context 'default' do
      it { is_expected.to contain_augeas('listen_address').with_changes('set web-app/context-param[3]/param-value/#text http://10.0.0.1:8080/pentaho') }
    end

    context 'custom' do
      let :pre_condition do
        "class { 'pentaho':
           listen_ip => '192.134.23.43',
         }"
      end

      it { is_expected.to contain_augeas('listen_address').with_changes('set web-app/context-param[3]/param-value/#text http://192.134.23.43:8080/pentaho') }
    end

  end

  describe 'rm hsqldb_autostartup' do

    let :pre_condition do
      "class { 'pentaho': }"
    end

    it { is_expected.to contain_augeas('rm_hsqldb_autostartup').with_lens('Xml.lns') }
    it { is_expected.to contain_augeas('rm_hsqldb_autostartup').with_incl('/usr/share/tomcat/webapps/pentaho/WEB-INF/web.xml') }
    it { is_expected.to contain_augeas('rm_hsqldb_autostartup').with_changes('rm /files/usr/share/tomcat/webapps/pentaho/WEB-INF/web.xml/web-app/context-param[10]') }

  end

  describe 'rm hsqldb_listener' do

    let :pre_condition do
      "class { 'pentaho': }"
    end

    it { is_expected.to contain_augeas('rm_hsqldb_listener').with_lens('Xml.lns') }
    it { is_expected.to contain_augeas('rm_hsqldb_listener').with_incl('/usr/share/tomcat/webapps/pentaho/WEB-INF/web.xml') }
    it { is_expected.to contain_augeas('rm_hsqldb_listener').with_changes('rm /files/usr/share/tomcat/webapps/pentaho/WEB-INF/web.xml/web-app/listener[3]') }

  end

  describe 'configure context.xml' do

    let :pre_condition do
      "class { 'pentaho': }"
    end

    it { is_expected.to contain_file('/usr/share/tomcat/webapps/pentaho/META-INF/context.xml') }

  end

  describe 'install webapp' do

    let :pre_condition do
      "class { 'pentaho': }"
    end

    it { is_expected.to contain_exec('/bin/cp -r /var/tmp/biserver-ce/tomcat/webapps/pentaho* /usr/share/tomcat/webapps/').with_unless('/usr/bin/stat /usr/share/tomcat/webapps/pentaho') }

  end

end
