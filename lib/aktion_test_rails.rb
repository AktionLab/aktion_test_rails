require 'aktion_test'
require "aktion_test_rails/version"

module AktionTest
  module Module
    extend ActiveSupport::Autoload

    autoload :Rails

    ActiveSupport.on_load(:aktion_test_module_rails) do
      class Rails
        extend ActiveSupport::Autoload

        autoload :AktionTest
        autoload :Capybara
        autoload :FactoryGirl
        autoload :RSpec, 'aktion_test/module/rails/rspec'
        autoload :ShouldaMatchers
        autoload :Simplecov
      end
    end
  end
end

module AktionTestRails
  extend ActiveSupport::Autoload

  module Support
    module Capybara
      extend ActiveSupport::Autoload
      autoload :RackApp
    end

    module Rails
      extend ActiveSupport::Autoload
      autoload :ModelBuilder
    end

    module ActiveAdmin
      extend ActiveSupport::Autoload
      autoload :Request

      ActiveSupport.on_load(:aktion_test_rails_support_active_admin_request) do
        module Request
          extend ActiveSupport::Autoload
          autoload :SignIn
        end
      end
    end
  end

  module Matchers
    extend ActiveSupport::Autoload
    
    autoload :ActiveAdmin
    autoload :FactoryGirl

    ActiveSupport.on_load(:aktion_test_rails_matchers_active_admin) do
      module ActiveAdmin
        extend ActiveSupport::Autoload
        autoload :Flash
      end
    end

    ActiveSupport.on_load(:aktion_test_rails_matchers_active_admin) do
      module FactoryGirl
        extend ActiveSupport::Autoload
        autoload :Validation
      end
    end
  end
end
