ENV['RAILS_ENV'] = 'test'
require "dummy/config/environment"

require "checkboxes"
require 'capybara/rspec'
require "rspec/rails"
require 'rspec_tag_matchers'
require "factory_girl"

ActiveRecord::Base.establish_connection :adapter => "sqlite3", :database => ":memory:"
load "schema.rb"

FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include RspecTagMatchers
end
