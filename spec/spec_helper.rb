$:.unshift File.dirname(__FILE__)

require 'aktion_test_rails'

TESTAPP_ROOT = File.join(File.dirname(__FILE__), 'rails_app')
I18n.load_path << File.join(TESTAPP_ROOT, 'config/locales/en.yml')
I18n.load_path << File.join(TESTAPP_ROOT, 'config/locales/devise.en.yml')

ENV['RAILS_ENV'] = 'test'

require 'activeadmin'

AktionTest::SpecHelper.load do
  load :Rails, :path => File.expand_path('../rails_app/config/environment', __FILE__)
  load :Timecop, :Faker, :RSpec, :FactoryGirl, :AktionTest

  within :Rails do
    load :RSpec, :ShouldaMatchers, :Simplecov, :RSpec, :FactoryGirl, :Capybara
  end
end

ActiveRecord::Migration.verbose = false
ActiveRecord::Migrator.migrate("#{Rails.root}/db/migrate")
