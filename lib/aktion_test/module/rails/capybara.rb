module AktionTest
  module Module
    module Rails
      module Capybara
        extend ActiveSupport::Concern

        included do |spec_helper|
          require 'capybara/rails'
          require 'capybara/rspec'
          require 'capybara/poltergeist'

          ::Capybara.javascript_driver = :poltergeist

          class ActiveRecord::Base
            mattr_accessor :shared_connection
            @@shared_connection = nil

            def self.connection
              @@shared_connection ||= retrieve_connection
            end
          end

          ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
        end
      end
    end
  end
end
