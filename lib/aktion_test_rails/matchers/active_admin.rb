module AktionTestRails
  module Matchers
    # = Matchers for ActiveAdmin specs
    #
    # == Flash
    #
    # This method will test for the presence or absence of
    # a flash message. The flash type and message are optional,
    # if both are omitted then the matcher will simply look for
    # a flash block. If the type is specified then it will also
    # check that the flash type is a match.
    #
    # The matcher expects the subject to be a page from a request spec.
    #
    #   describe 'AdminUser List' do
    #     describe 'destroy' do
    #       it 'display a flash message after deleting an admin user' do
    #         admin = AdminUser.create!(...)
    #         visit admin_admin_users_path
    #         within("tr#admin_user_#{admin.id}") { click_button 'Delete' }
    #         page.should have_flash(:notice, 'Admin deleted sucessfully.')
    #         # OR
    #         page.should have_flash('Admin deleted sucessfully.')
    #         # OR
    #         page.should have_flash(:notice)
    #         # OR
    #         page.should have_flash
    #       end
    #     end
    #   end
    #
    # Alternatively the opposing matchers also work as expected.
    #
    #   # will fail if a flash exists
    #   should_not have_flash
    #   # will fail if a flash notice exists
    #   should_not have_flash(:notice)
    #   # will fail if a flash with the given message exists
    #   should_not have_flash('message')
    #   # will fail if a flash notice exists with the given message
    #   should_not have_flash(:notice, 'message')
    module ActiveAdmin
      extend ActiveSupport::Concern

      included { include Flash }
    end
  end
end

ActiveSupport.run_load_hooks(:aktion_test_rails_matchers_active_admin)
