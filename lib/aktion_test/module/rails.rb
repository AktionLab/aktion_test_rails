module AktionTest
  module Module
    module Rails
      extend ActiveSupport::Concern
      
      ENV['RAILS_ENV'] ||= 'test'

      included do |spec_helper|
        require spec_helper.instance.options[:Rails][:path]
      end
    end
  end
end

ActiveSupport.run_load_hooks :aktion_test_module_rails
