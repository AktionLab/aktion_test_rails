module AktionTestRails
  module Support
    module Capybara
      module RackApp
        def capybara_rack_app
          rack_app = -> env { [200, {'Content-Type' => 'text/html'}, [yield(env)]] }
          ::Capybara::Session.new(:rack_test, rack_app)
        end
      end
    end
  end
end

