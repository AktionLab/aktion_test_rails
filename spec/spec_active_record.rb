require 'active_record'
require 'rspec/rails/adapters'
require 'rspec/rails/fixture_support'

if RUBY_PLATFORM =~ /java/
  ActiveRecord::Base.establish_connection(adapter: 'jdbcsqlite3', database: 'tmp/test.sqlite3')
else
  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'tmp/test.sqlite3')
end

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end
