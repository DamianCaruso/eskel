require 'sass'
require 'sprockets'
require 'sprockets-helpers'
require 'sprockets-sass'
require 'uglifier'

$sprockets_env = Sprockets::Environment.new(APP_ROOT).tap do |env|
  env.append_path 'assets/images'
  env.append_path 'assets/javascripts'
  env.append_path 'assets/stylesheets'
  env.append_path 'vendor/assets/images'
  env.append_path 'vendor/assets/javascripts'
  env.append_path 'vendor/assets/stylesheets'
end

Sprockets::Helpers.configure do |c|
  c.environment = $sprockets_env
  c.expand      = APP_ENV == 'development'
  c.protocol    = :relative
  c.manifest    = Sprockets::Manifest.new($sprockets_env, APP_ROOT.join('public','assets','manifest.json'))
  c.prefix      = 'assets'
  c.digest      = APP_ENV != 'development'
  c.public_path = './public'
end