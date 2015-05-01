ENV["RAILS_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)

require "factory_girl_rails"
require "rspec/rails"
require "shoulda/matchers"

Dir[Rails.root.join("lib/**/*.rb")].each { |file| require file }
Dir[Rails.root.join("spec/support/**/*.rb")].each { |file| require file }

module Features
  # Extend this module in spec/support/features/*.rb
  include Formulaic::Dsl
end

Monban.test_mode!

RSpec.configure do |config|
  config.include Features, type: :feature
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false

  config.include Monban::Test::Helpers, type: :feature
  config.after :each do
    Monban.test_reset!
  end
end

ActiveRecord::Migration.maintain_test_schema!
Capybara.javascript_driver = :webkit
