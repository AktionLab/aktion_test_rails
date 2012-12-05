TESTAPP_ROOT = File.join(File.dirname(__FILE__), 'rails_app')
PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..')).freeze
ENV['BUNDLE_GEMFILE'] ||= "#{TESTAPP_ROOT}/Gemfile"

$:.unshift File.dirname(__FILE__)
$:.unshift File.join(PROJECT_ROOT, 'lib')

require "rails_app/config/environment"
require 'aktion_test_rails/rails'

I18n.load_path << File.join(TESTAPP_ROOT, 'config/locales/en.yml')
I18n.load_path << File.join(TESTAPP_ROOT, 'config/locales/devise.en.yml')

ActiveRecord::Migration.verbose = false
ActiveRecord::Migrator.migrate("#{Rails.root}/db/migrate")

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end
