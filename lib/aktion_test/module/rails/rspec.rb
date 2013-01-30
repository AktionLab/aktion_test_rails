module AktionTest
  module Module
    module Rails
      module RSpec
        extend ActiveSupport::Concern

        included do |spec_helper|
          require 'rspec/rails'

          ::RSpec.configure do |config|
            config.fixture_path = "#{::Rails.root}/spec/fixtures"
            config.use_transactional_fixtures = true
            config.infer_base_class_for_anonymous_controllers = false
          end
        end
      end
    end
  end
end

