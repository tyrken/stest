require 'serverspec_helper'

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe command('curl http://localhost') do
  its(:stdout) { should match /^Hi there, I\'m served from app[1-2]!$/ }
  its(:exit_status) { should eq 0 }
end
