$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tracked/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tracked"
  s.version     = Tracked::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Tracked."
  s.description = "TODO: Description of Tracked."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "delayed_job", "4.0.0"
  s.add_dependency "delayed_job_active_record", "4.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
