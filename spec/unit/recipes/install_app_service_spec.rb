#
# Cookbook Name:: stest
# Spec:: install_app_service
#

require 'spec_helper'

describe 'stest::install_app_service' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates an \'app\' user' do
      expect(chef_run).to create_user('app')
    end

    it 'starts the service \'sample_app\'' do
      expect(chef_run).to enable_service('sample_app')
      expect(chef_run).to start_service('sample_app')
    end
  end
end
