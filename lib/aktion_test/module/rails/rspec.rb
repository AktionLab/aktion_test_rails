module AktionTest
  module Module
    class Rails
      class RSpec < Base
        def initialize(spec, options={})
          spec.use ::AktionTest::Module::RSpec
          super
        end

        def prepare
          require 'rspec/rails'
        end

        def configure
          rspec.fixture_path = "#{::Rails.root}/spec/fixtures"
          rspec.use_transactional_fixtures = true
          rspec.infer_base_class_for_anonymous_controllers = false
        end
      end
    end
  end
end

