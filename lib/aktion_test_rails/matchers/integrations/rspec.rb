if defined?(::ActiveRecord)
  if defined?(::FactoryGirl)
    require 'aktion_test_rails/matchers/factory_girl'

    module RSpec::Matchers
      include AktionTestRails::Matchers::FactoryGirl
    end
  end
end
