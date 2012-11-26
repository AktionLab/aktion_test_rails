require 'simplecov'

SimpleCov.start do
  add_filter '/tmp/'
end

TESTAPP_ROOT = File.join(File.dirname(__FILE__), '..', 'tmp', 'testapp')
FileUtils.rm_rf(TESTAPP_ROOT) if File.exists?(TESTAPP_ROOT)
`rails new #{TESTAPP_ROOT}`

ENV['RAILS_ENV'] = 'test'
ENV['BUNDLE_GEMFILE'] ||= "#{TESTAPP_ROOT}/Gemfile"

require "#{TESTAPP_ROOT}/config/environment"
require 'aktion_test_rails'
require 'aktion_test_rails/class_builder'
require 'aktion_test_rails/model_builder'

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..')).freeze

$LOAD_PATH << File.join(PROJECT_ROOT, 'lib')

Dir[File.join(File.dirname(__FILE__), 'support', '**', '*.rb')].each{|file| require file}


ActiveRecord::Migration.verbose = false
ActiveRecord::Migrator.migrate("#{Rails.root}/db/migrate")

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.order = 'random'
end
