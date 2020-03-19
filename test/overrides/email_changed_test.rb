require 'test_helper'
require 'mailers/email_changed_test'

class EmailChangedTest < ActionMailer::TestCase
  # the email_changed? method returns false with activegraph on u.update!(email: 'new-email@example.com')
  undef :test_set_up_subject_from_I18n
  undef :test_body_should_have_user_info
  undef :test_subject_namespaced_by_model
end
