require 'spec_helper'

describe AktionTestRails::Matchers::FactoryGirl::ValidFactoryMatcher do
  it "should accept a valid factory" do
    define_model :user, :name => :string
    FactoryGirl.define do
      factory :user do
        name "Name"
      end
    end

    User.new.should have_a_valid_factory(:user)
  end
end
