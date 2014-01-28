$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tracked/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tracked_job"
  s.version     = Tracked::VERSION
  s.authors     = ["Ludvig Dickman", "Jenny Olsson", "Avidity"]
  s.email       = ["code@avidity.se"]
  s.homepage    = "http://github.com/avidity/tracked_job"
  s.summary     = "Track background jobs"
  s.description = "Adds the ability to track backgrounds jobs. Currently only for delayed_job."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "delayed_job", "4.0.0"
  s.add_dependency "delayed_job_active_record", "4.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
