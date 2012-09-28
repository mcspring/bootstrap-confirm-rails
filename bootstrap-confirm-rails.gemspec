$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap-confirm-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap-confirm-rails"
  s.version     = BootstrapConfirmRails::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Spring MC"]
  s.email       = ["Heresy.Mc@gmail.com"]
  s.homepage    = "https://github.com/mcspring/bootstrap-confirm-rails"
  s.summary     = "Custom rails delete confirmation dialog use Bootstrap modal."
  s.description = "Applies a custom delete confirmation dialog for rails default data-confirm action."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "sass-rails", "~> 3.2.5"
  s.add_dependency "coffee-rails", "~> 3.2.2"
  s.add_dependency "bootstrap-sass", "~> 2.1.0.0"

  s.add_development_dependency "rspec-rails"
end
