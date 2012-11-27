module AktionTestRails
  module ActiveAdmin
    module Request
      module SignIn
        def sign_in_active_admin
          @admin ||= FactoryGirl.create(:admin_user)
          visit new_admin_user_session_path
          fill_in 'Email', with: @admin.email
          fill_in 'Password', with: 'password'
          click_button 'Login'
        end
      end
    end
  end
end
