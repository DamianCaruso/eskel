namespace :assets do
  desc "Compile assets"
  task precompile: :clean do
    env = ENV['RACK_ENV'] || 'development'
    system "RACK_ENV=#{env} bundle exec rakep build"
  end

  desc "Clean assets"
  task :clean do
    env = ENV['RACK_ENV'] || 'development'
    system "RACK_ENV=#{env} bundle exec rakep clean"
  end
end