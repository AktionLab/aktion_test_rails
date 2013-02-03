require 'spec_helper'

describe AktionTestRails::Support::ActiveAdmin::Request::SignIn do
  include described_class

  before(:all) do
    unless FactoryGirl.factories.registered?(:admin_user)
      FactoryGirl.define do
        factory :admin_user do
          sequence(:email) {|n| "admin-#{n}@example.com"}
          password 'password'
          password_confirmation 'password'
        end
      end
    end
  end

  it "should create and sign in an admin user" do
    sign_in_active_admin
    page.should have_content "Signed in successfully."
    current_path.should == '/admin'
  end

  it "should create an admin user" do
    expect { sign_in_active_admin }.to change { AdminUser.count }.by 1
    @admin.should be_a AdminUser
  end

  it "should not create an admin user if it already exists" do
    @admin = FactoryGirl.create(:admin_user)
    expect { sign_in_active_admin }.to_not change { AdminUser.count }
  end
end
