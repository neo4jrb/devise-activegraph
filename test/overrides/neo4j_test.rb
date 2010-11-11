require 'test_helper'

if DEVISE_ORM == :neo4j

  class ValidatableTest < ActiveSupport::TestCase
    #undef test_should_require_a_password_with_minimum_of_6_characters

    # DataMapper uses a :value_between error message when given a minimum and
    # maximum; ActiveModel shows either the :too_long or :too_short message.
    #test 'should require a password with minimum of 6 characters' do
    #  user = new_user(:password => '12345', :password_confirmation => '12345')
    #  assert user.invalid?
    #  # assert_equal 'is too short (minimum is 6 characters)', user.errors[:password].join
    #  assert_equal 'must be between 6 and 20 characters long', user.errors[:password].join
    #end

    #undef test_should_require_a_password_with_maximum_of_20_characters_long

    # Same issue as previous test
    #test 'should require a password with maximum of 20 characters long' do
    #  user = new_user(:password => 'x'*21, :password_confirmation => 'x'*21)
    #  assert user.invalid?
      # assert_equal 'is too long (maximum is 20 characters)', user.errors[:password].join
    #  assert_equal 'must be between 6 and 20 characters long', user.errors[:password].join
    #end

  end
  
end
