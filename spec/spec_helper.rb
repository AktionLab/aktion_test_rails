ENV['RAILS_ENV'] = 'test'

require 'simplecov'

SimpleCov.start do
  add_filter '/tmp/'
  add_filter '/spec/'
  minimum_coverage 100
end

TESTAPP_ROOT = File.join(File.dirname(__FILE__), 'rails_app')
PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..')).freeze
ENV['BUNDLE_GEMFILE'] ||= "#{TESTAPP_ROOT}/Gemfile"

$:.unshift File.dirname(__FILE__)
$:.unshift File.join(PROJECT_ROOT, 'lib')

require "rails_app/config/environment"
require 'rspec/rails'
require 'aktion_test_rails'
require 'aktion_test_rails/class_builder'
require 'aktion_test_rails/model_builder'

I18n.load_path << File.join(TESTAPP_ROOT, 'config/locales/en.yml')
I18n.load_path << File.join(TESTAPP_ROOT, 'config/locales/devise.en.yml')

Dir[File.join(File.dirname(__FILE__), 'factories', '*.rb')].each {|file| require file}
Dir[File.join(File.dirname(__FILE__), 'support', '**', '*.rb')].each{|file| require file}

ActiveRecord::Migration.verbose = false
ActiveRecord::Migrator.migrate("#{Rails.root}/db/migrate")

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.order = 'random'
end
