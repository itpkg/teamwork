$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "teamwork/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "teamwork"
  s.version     = Teamwork::VERSION
  s.authors     = ["flamen"]
  s.email       = ["jitang.zheng@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Teamwork."
  s.description = "TODO: Description of Teamwork."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "mysql2"
end
