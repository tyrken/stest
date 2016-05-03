# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.berkshelf.enabled = true

  config.vm.define 'app1', primary: true do |app|
    app.vm.box = 'ubuntu/trusty64'
    app.vm.hostname = 'app1'
    app.vm.network :private_network, ip: '192.168.8.10'
    config.vm.provision :chef_solo do |chef|
      chef.add_recipe('stest::app_node')
    end
  end

  config.vm.define 'app2', autostart: true do |app|
    app.vm.box = 'ubuntu/trusty64'
    app.vm.hostname = 'app2'
    app.vm.network :private_network, ip: '192.168.8.11'
    config.vm.provision :chef_solo do |chef|
      chef.add_recipe('stest::app_node')
    end
  end

  config.vm.define 'web', autostart: true do |web|
    web.vm.box = 'ubuntu/trusty64'
    web.vm.hostname = 'web'
    web.vm.network :private_network, ip: '192.168.8.8'
    config.vm.provision :chef_solo do |chef|
      chef.add_recipe('stest::web_node')
      chef.json = {
        'stest' => {
          'app_port' => 8484,
          'app_nodes' => {
            'app1' => '192.168.8.10',
            'app2' => '192.168.8.11'
          }
        }
      }
    end
  end
end
