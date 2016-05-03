#
# Cookbook Name:: stest
# Recipe:: install_service_app
#

user 'app' do
  comment 'service account for sample_app'
  system true
  shell '/bin/false'
end

cookbook_file '/etc/init/sample_app.conf'

service 'sample_app' do
  action [:enable, :start]
end
