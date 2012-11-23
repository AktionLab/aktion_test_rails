module AktionTestRails
  module Matchers
    module FactoryGirl
      def have_a_valid_factory(factory_name)
        ValidFactoryMatcher.new(factory_name)
      end

      class ValidFactoryMatcher
        def initialize(factory_name)
          @factory_name = factory_name
        end

        def matches?(subject)
          @subject = subject
          factory_exists? && factory_creates_valid_record?
        end

        def failure_message
          "Expected #{@factory_name} to be a valid factory."
        end

        def description
          "has a valid factory named #{@factory_name}"
        end

      protected

        def factory_exists?
          ::FactoryGirl.factory_by_name(@factory_name)
        end

        def factory_creates_valid_record?
          ::FactoryGirl.build(@factory_name).valid?
        end
      end
    end
  end
end
