require 'spec_helper'

describe 'pentaho' do

  let (:facts) {{ :osfamily => 'RedHat' }}

  describe 'install flow process' do

    it 'contains pentaho::setup' do
      is_expected.to contain_class('pentaho::setup').that_comes_before('Class[Pentaho::config]')
    end

    it 'contains pentaho::config' do
      is_expected.to contain_class('pentaho::config').that_comes_before('Class[Pentaho::webapp]')
    end

    it 'contains pentaho::webapp' do
      is_expected.to contain_class('pentaho::webapp')
    end

  end

end
