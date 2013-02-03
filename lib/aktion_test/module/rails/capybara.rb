module AktionTest
  module Module
    class Rails
      class Capybara < Base
        def prepare
          require 'capybara/rails'
          require 'capybara/rspec'
          require 'capybara/poltergeist'
        end

        def configure
          ::Capybara.javascript_driver = :poltergeist
        end
      end
    end
  end
end

ActiveSupport.on_load(:active_recod) do
  class ActiveRecord::Base
    mattr_accessor :shared_connection
    @@shared_connection = nil

    def self.connection
      @@shared_connection ||= retrieve_connection
    end
  end

  ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
end
