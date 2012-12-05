module AktionTestRails
  module Support
    module ActiveAdmin
      module Request
        extend ActiveSupport::Concern

        included do
          include SignIn
        end
      end
    end
  end
end

ActiveSupport.run_load_hooks(:aktion_test_rails_support_active_admin_request)

