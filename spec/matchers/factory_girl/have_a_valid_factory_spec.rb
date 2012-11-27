require 'spec_helper'

describe AktionTestRails::Matchers::FactoryGirl::ValidFactoryMatcher do
  after(:each) do
    FactoryGirl.factories.clear
  end

  it "accepts a valid factory" do
    define_model :user, :name => :string
    FactoryGirl.define do
      factory :user do
        name "Name"
      end
    end

    User.new.should have_a_valid_factory(:user)
  end

  context "when the factory does not exist" do
    before(:each) { define_model :user }

    it "does not accept the factory" do
      User.new.should_not have_a_valid_factory(:user)
    end

    it "says that the factory does not exist" do
      matcher = described_class.new(:user).tap{|m| m.matches?(User.new)}
      expected_message = <<-ERROR
Expected :user to be a valid factory.
  No factory by the name :user found
      ERROR
      matcher.failure_message.should == expected_message.strip
    end
  end

  context 'when the factory has validation errors' do
    before(:each) do
      define_model :user, :name => :string do
        validates_presence_of :name
      end
      FactoryGirl.define do
        factory :user do
          name nil
        end
      end
    end

    it "does not accept the factory" do
      User.new.should_not have_a_valid_factory(:user)
    end

    it "should detail validation errors with the factory" do
      matcher = described_class.new(:user).tap{|m| m.matches?(User.new)}
      expected_message = <<-ERROR
Expected :user to be a valid factory.
  Failed Validations:
    Name can't be blank
      ERROR
      matcher.failure_message.should == expected_message.strip
    end
  end
end
