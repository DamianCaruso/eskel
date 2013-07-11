require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = ['lib', 'test']
  t.verbose = true
  t.test_files = FileList['test/**/test_*.rb']
end

task :environment do
  require File.expand_path('init', File.dirname(__FILE__))
end

Dir[File.join(File.dirname(__FILE__), 'lib', 'tasks', '**', '*.rake')].each { |f| load f }

task :default => :test