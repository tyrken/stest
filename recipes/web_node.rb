#
# Cookbook Name:: stest
# Recipe:: web_node
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'nginx'

nginx_site 'default' do
  enable false
end

template '/etc/nginx/sites-available/sample_app' do
  mode '0644'
  owner 'root'
  group 'root'
  variables(app_nodes: node['stest']['app_nodes'],
            app_port: node['stest']['app_port'])
end

nginx_site 'sample_app'
