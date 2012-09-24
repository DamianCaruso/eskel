desc "Start IRB console"
task :console do
  require 'irb'
  ARGV.clear
  IRB.start
end