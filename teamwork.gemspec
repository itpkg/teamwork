$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'teamwork/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'teamwork'
  s.version     = Teamwork::VERSION
  s.authors     = ['Jitang Zheng', 'Sen Zhang']
  s.email       = ['jitang.zheng@gmail.com']
  s.homepage    = 'https://github.com/itpkg/teamwork'
  s.summary     = 'Summary of Teamwork.'
  s.description = 'Description of Teamwork.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.2.0'

  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'

  s.test_files = Dir['spec/**/*']
end
