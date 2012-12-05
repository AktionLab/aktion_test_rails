module AktionTestRails
  module Matchers
    module FactoryGirl
      module Validation
        def have_valid_factory(factory_name)
          ValidFactoryMatcher.new(factory_name)
        end

        class ValidFactoryMatcher < AktionTest::Matchers::Base
          def initialize(factory_name)
            @factory_name = factory_name
          end

          def matches?(subject)
            factory_exists? && factory_creates_valid_record?
          end

          def expectation
            ":#{@factory_name} to be a valid factory."
          end

          def problem
            message = "\n"
            if factory_exists?
              if @record.errors.full_messages.any?
                message << "Failed Validations:\n"
                @record.errors.full_messages.each do |error|
                  message << "  #{error}\n"
                end
              end
            else
              message << "No factory by the name :#{@factory_name} found\n"
            end
            message
          end

          def negative_problem
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
