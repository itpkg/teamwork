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
  s.summary     = 'Teamwork'
  s.description = 'Teamwork'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.0'

  s.add_development_dependency 'mysql2'
end
