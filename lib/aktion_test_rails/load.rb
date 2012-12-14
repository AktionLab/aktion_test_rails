require 'rspec-rails'
require 'rspec/rails'
require 'shoulda-matchers'
require 'factory_girl_rails'
require 'timecop'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.mock_with :rspec

  config.before :each do
    Timecop.return if defined? Timecop
  end

  config.after :each do
    Timecop.return if defined? Timecop
  end
end
