ENV['RAILS_ENV'] = 'test'

require 'simplecov'

SimpleCov.start do
  add_filter '/tmp/'
  add_filter '/spec/'
  minimum_coverage 100
end

FileUtils.mkdir('tmp') unless Dir.exists?('tmp')

require 'aktion_test_rails'
require 'capybara'
require 'active_support/core_ext/string'

Dir[File.join(File.dirname(__FILE__), 'support', '**', '*.rb')].each{|file| require file}

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.order = 'random'
end
