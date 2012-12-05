require 'faker'
require 'aktion_test'
require "aktion_test_rails/version"

require 'active_support/dependencies/autoload'
require 'active_support/concern'
require 'active_support/lazy_load_hooks'

module AktionTestRails
  extend ActiveSupport::Autoload
  
  autoload :ModelBuilder

  module Support
    module Capybara
      extend ActiveSupport::Autoload
      autoload :RackApp
    end

    module Rails
      extend ActiveSupport::Autoload
      autoload :ModelBuilder
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
