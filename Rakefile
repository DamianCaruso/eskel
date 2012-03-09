require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

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