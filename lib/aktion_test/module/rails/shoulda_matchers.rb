module AktionTest
  module Module
    class Rails
      class ShouldaMatchers < Base
        def prepare
          require 'shoulda-matchers'
        end
      end
    end
  end
end

