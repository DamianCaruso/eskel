$:.push File.expand_path('../lib', __FILE__)
require 'eskel/version'

Gem::Specification.new do |s|
  s.name         = 'eskel'
  s.version      = Eskel::VERSION
  s.platform     = Gem::Platform::RUBY
  s.homepage     = 'https://github.com/DamianCaruso/eskel'
  s.summary      = 'Ruby web app generator'
  s.description  = 'Ruby web app generator'
  s.authors      = ['Damian Caruso']
  s.email        = ['damian.caruso@gmail.com']
  s.licenses     = ['MIT']

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'cuba',    '~> 3.3.0'
  s.add_dependency 'dotenv',  '~> 1.0.2'
  s.add_dependency 'tilt',    '~> 2.0.1'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
end