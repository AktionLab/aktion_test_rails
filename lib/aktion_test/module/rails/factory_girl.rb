module AktionTest
  module Module
    module Rails
      module FactoryGirl
        extend ActiveSupport::Concern

        included do |spec_helper|
          require 'factory_girl_rails'
        end
      end
    end
  end
end

