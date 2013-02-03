module AktionTest
  module Module
    class Rails
      class AktionTest < Base
        def initialize(spec, options={})
          spec.use ::AktionTest::Module::AktionTest
          super
        end
      end
    end
  end
end
