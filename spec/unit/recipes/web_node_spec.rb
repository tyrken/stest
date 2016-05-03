#
# Cookbook Name:: stest
# Spec:: web_node
#

require 'spec_helper'

describe 'stest::web_node' do
  context 'When all attributes are default, on an unspecified platform' do
    before do
      # work around nginx cookbook internals
      stub_command('which nginx').and_return(true)
    end

    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.node.set['stest']['app_port'] = 8484
      runner.node.set['stest']['app_nodes']['0'] = 'someserver'
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'starts the service \'sample_app\'' do
      expect(chef_run).to enable_service('nginx')
      expect(chef_run).to start_service('nginx')
    end

    it 'creates the nginx config \'sample_app\'' do
      expect(chef_run).to render_file('/etc/nginx/sites-available/sample_app')
        .with_content(/someserver:8484/)
    end

    it 'activates the nginx config \'sample_app\'' do
      expect(chef_run).to disable_nginx_site('default')
      expect(chef_run).to enable_nginx_site('sample_app')
    end
  end
end
