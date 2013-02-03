module AktionTest
  module Module
    class Rails
      class Simplecov < Base
        def initialize(spec, options={})
          require 'simplecov'
          ::SimpleCov.start 'rails'
          super
        end
      end
    end
  end
end
