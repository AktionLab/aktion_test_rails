module AktionTest
  module Module
    class Rails < Base
      def prepare
        require options[:path]
      end
    end
  end
end

ActiveSupport.run_load_hooks :aktion_test_module_rails
