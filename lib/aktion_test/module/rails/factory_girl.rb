module AktionTest
  module Module
    class Rails
      class FactoryGirl < Base
        def initialize(spec, options={})
          super
        end

        def prepare
          require 'factory_girl_rails'
        end

        def configure
          rspec.include ::FactoryGirl::Syntax::Methods
          rspec.include AktionTestRails::Matchers::FactoryGirl, type: :model
        end
      end
    end
  end
end

