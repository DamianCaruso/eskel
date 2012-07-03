require File.expand_path("config/boot", File.dirname(__FILE__))
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = ["lib", "spec"]
  t.name = "spec:unit"
  t.test_files = FileList['spec/unit/*_spec.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs = ["lib", "spec"]
  t.name = "spec:integration"
  t.test_files = FileList['spec/integration/*_spec.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs = ["lib", "spec"]
  t.name = "spec"
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end

task :default => :spec

Dir[Eskel.root("lib","tasks","**","*.rake")].each { |f| load f }