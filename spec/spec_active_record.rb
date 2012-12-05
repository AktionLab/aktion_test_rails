require 'active_record'
require 'rspec/rails/adapters'
require 'rspec/rails/fixture_support'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'tmp/test.sqlite3')

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end
