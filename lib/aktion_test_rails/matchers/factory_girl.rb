module AktionTestRails
  module Matchers
    # = Matchers for FactoryGirl factories
    #
    # These methods will test that factories are producing valid records
    #
    #   describe User do
    #     it { should have_a_valid_factory(:user) }
    #   end
    #
    module FactoryGirl
      extend ActiveSupport::Concern

      included do |base|
        base.send :include, Validation
      end
    end
  end
end

ActiveSupport.run_load_hooks(:aktion_test_rails_matchers_active_admin)
