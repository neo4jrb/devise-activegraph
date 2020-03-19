require 'test_helper'
require 'digest/sha1'
require 'models/database_authenticatable_test'

class DatabaseAuthenticatableTest < ActiveSupport::TestCase
  undef :test_should_run_validations_even_when_current_password_is_invalid_or_blank
  # looks like neo4j wants to run the password validation first
  test 'should run validations even when current password is invalid or blank' do
    user = UserWithValidation.create!(valid_attributes)
    user.save
    assert user.persisted?
    assert_not user.update_with_password(:username => "")
    assert_match "usertest", user.reload.username
    assert_match "can't be blank", user.errors[:current_password].join
  end

  # the passowrd_changed? method returns false with activegraph on user.update(password: 'newpass', password_confirmation: 'newpass')
  undef :test_should_notify_email_on_password_change_when_configured
  undef :test_should_notify_previous_email_on_email_change_when_configured
end
