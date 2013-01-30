module AktionTest
  module Module
    module Rails
      module ShouldaMatchers
        extend ActiveSupport::Concern

        included do |spec_helper|
          require 'shoulda-matchers'
        end
      end
    end
  end
end

