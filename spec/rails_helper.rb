ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'database_cleaner'
require 'capybara/rspec'
require 'email_spec'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.app_host = 'http://lvh.me:3000'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Rails.application.routes.url_helpers
  config.include Capybara::DSL
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
  #config.include Devise::TestHelpers, type: :controller
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
    Apartment::Tenant.reset
    drop_schemas
    Capybara.app_host = 'http://lvh.me:3000'
    reset_mailer
  end
end
