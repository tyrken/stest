#
# Cookbook Name:: stest
# Spec:: build_app
#

require 'spec_helper'

describe 'stest::build_app' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'has dropped the sample_app source code file for compilation' do
      expect(chef_run).to create_cookbook_file('/usr/local/src/sample_app.go')
    end
  end
end
