module AktionTestRails
  module Matchers
    module FactoryGirl
      module Validation
        def have_valid_factory(factory_name)
          ValidFactoryMatcher.new(factory_name)
        end

        class ValidFactoryMatcher
          def initialize(factory_name)
            @factory_name = factory_name
          end

          def matches?(subject)
            factory_exists? && factory_creates_valid_record?
          end

          def failure_message
            message = "Expected :#{@factory_name} to be a valid factory."
            if factory_exists?
              if @record.errors.full_messages.any?
                message << "\n  Failed Validations:"
                @record.errors.full_messages.each do |error|
                  message << "\n    #{error}"
                end
              end
            else
              message << "\n  No factory by the name :#{@factory_name} found"
            end
            message
          end

          def description
            "has a valid factory named :#{@factory_name}"
          end

        protected

          def factory_exists?
            ::FactoryGirl.factories.registered?(@factory_name)
          end

          def factory_creates_valid_record?
            @record = ::FactoryGirl.build(@factory_name)
            @record.valid?
          end
        end
      end
    end
  end
end
