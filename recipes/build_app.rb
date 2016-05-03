#
# Cookbook Name:: stest
# Recipe:: build_app
#

# include_recipe 'golang'
package('golang-go')

cookbook_file '/usr/local/src/sample_app.go' do
  notifies :run, 'execute[compile_app]', :immediately
end

execute 'compile_app' do
  #  command 'GOBIN=/usr/local/bin /usr/local/go/bin/go install sample_app.go'
  command 'GOBIN=/usr/local/bin go install sample_app.go'
  cwd '/usr/local/src/'
end
