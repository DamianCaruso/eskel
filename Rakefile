require File.expand_path("config/boot", File.dirname(__FILE__))
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = ["lib", "test"]
  t.verbose = true
  t.test_files = FileList['test/**/test_*.rb']
end

task :default => :test

Dir[Eskel.root("lib", "tasks", "**", "*.rake")].each { |f| load f }