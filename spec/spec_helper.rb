$:.unshift File.dirname(__FILE__)

require 'aktion_test_rails'
ENV['RAILS_ENV'] = 'test'

TESTAPP_ROOT = File.join(File.dirname(__FILE__), 'rails_app')
I18n.load_path << File.join(TESTAPP_ROOT, 'config/locales/en.yml')
I18n.load_path << File.join(TESTAPP_ROOT, 'config/locales/devise.en.yml')

require 'activeadmin'

AktionTest::SpecHelper.build do
  use :Timecop, :Faker
  use :Rails, :path => File.expand_path('../rails_app/config/environment', __FILE__)

  scope 'Rails' do
    use :Simplecov, :RSpec, :AktionTest, :ShouldaMatchers, :FactoryGirl, :Capybara
  end
end

ActiveRecord::Migration.verbose = false
ActiveRecord::Migrator.migrate("#{Rails.root}/db/migrate")
