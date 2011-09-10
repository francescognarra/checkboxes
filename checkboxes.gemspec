# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "checkboxes/version"

Gem::Specification.new do |s|
  s.name        = "checkboxes"
  s.version     = Checkboxes::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["lucapette"]
  s.email       = ["lucapette@gmail.com"]
  s.homepage    = "https://github.com/lucapette/checkboxes"
  s.summary     = %q{This gem will handle has_many :through association with checkboxes}
  s.description = %q{This gem will help you to handle has_many :through associations when you need to add/remove these ones with checkboxes.}

  s.rubyforge_project = "checkboxes"
  s.add_development_dependency 'sqlite3'
  s.add_dependency "rails", ">= 3.0.0"
  s.add_development_dependency "rspec-rails", ">= 2.5.0"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "rspec_tag_matchers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
