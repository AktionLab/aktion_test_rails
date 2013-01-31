module AktionTest
  module Module
    module Rails
      module FactoryGirl
        extend ActiveSupport::Concern

        included do |spec_helper|
          require 'factory_girl_rails'

          ::RSpec.configure do |config|
            config.include AktionTestRails::Matchers::FactoryGirl, type: :model
          end
        end
      end
    end
  end
end

