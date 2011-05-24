require "test_helper"

if DEVISE_ORM == :neo4j
  
  class RecoverableTest < ActiveSupport::TestCase
    undef :test_should_save_the_model_when_the_reset_password_sent_at_doesnt_exist
    
    test 'should save the model when the reset_password_sent_at doesnt exist' do
      user = create_user
      user.stubs(:respond_to?)
      user.stubs(:respond_to?).with("email=").returns(true)
      user.stubs(:respond_to?).with(:updated_at).returns(false)
      user.stubs(:respond_to?).with(:reset_password_sent_at=).returns(false)
      user.stubs(:respond_to?).with(:headers_for).returns(false)
      user.send_reset_password_instructions
      user.reload
      assert_not_nil user.reset_password_token
    end
  end
  
end
