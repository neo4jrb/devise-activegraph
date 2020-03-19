require 'action_dispatch/testing/integration'

module IntegrationTestOveride

  def create_user(options={})
    @user ||= begin
      user = User.create!(
        username: 'usertest',
        email: options[:email] || 'user@test.com',
        password: options[:password] || '12345678',
        password_confirmation: options[:password] || '12345678',
        created_at: Time.now.utc
      )
      user.update_attribute(:confirmation_sent_at, options[:confirmation_sent_at]) if options[:confirmation_sent_at]
      user.confirm unless options[:confirm] == false
      user.lock_access! if options[:locked] == true
      user
    end
  end
end

ActionDispatch::IntegrationTest.prepend IntegrationTestOveride
