require 'rake'
require 'rspec/core/rake_task'

task default: :all

desc 'Run ruby and chef style checks'
task style: ['style:ruby', 'style:chef']

namespace :style do
  require 'rubocop/rake_task'
  desc 'Run Ruby style checks using rubocop'
  RuboCop::RakeTask.new(:ruby)

  require 'foodcritic'
  desc 'Run Chef style checks using foodcritic'
  FoodCritic::Rake::LintTask.new(:chef)
end

desc 'Runs unit tests with chefspec'
RSpec::Core::RakeTask.new :unit do |t|
  t.verbose = false
  t.pattern = 'spec/unit/**/*_spec.rb'
end

desc 'Serverspec acceptance test all nodes'
task test: 'test:all'

namespace :test do
  targets = { app1: 'app', app2: 'app', web: 'web' }
  task all: targets.keys

  targets.each do |target, dir|
    desc "Run serverspec tests on #{target}"
    RSpec::Core::RakeTask.new(target) do |t|
      puts "Testing #{target}..."
      ENV['TARGET_HOST'] = target.to_s
      t.verbose = false
      t.pattern = "test/acceptance/#{dir}/**/*_spec.rb"
      t.ruby_opts = '-Itest/acceptance'
    end
  end
end

desc 'Build/deploy all nodes'
task :up do
  sh 'vagrant up'
end

desc 'Destroy all nodes'
task :destroy do
  sh 'vagrant destroy -f'
end

desc 'Build and test all nodes'
task all: [:style, :unit, :up, :test]
