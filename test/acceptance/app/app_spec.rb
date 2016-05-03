require 'serverspec_helper'

describe service('sample_app') do
  it { should be_enabled }
  it { should be_running }
end

describe command('curl http://localhost:8484') do
  targ = ENV['TARGET_HOST']
  its(:stdout) { should match /^Hi there, I\'m served from #{targ}!$/ }
  its(:exit_status) { should eq 0 }
end
