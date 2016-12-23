require "shared_user_without_email"

class UserWithoutEmail
  include Neo4j::ActiveNode
  include SharedUserWithoutEmail

  property :username, type: String
  property :facebook_token, type: String

  ## Database authenticatable
  property :email, type: String, default: ''
  property :encrypted_password, type: String, default: ''

  ## Recoverable
  property :reset_password_token, type: String
  property :reset_password_sent_at, type: DateTime

  ## Rememberable
  property :remember_created_at, type: DateTime

  ## Trackable
  property :sign_in_count, type: Integer, default: 0
  property :current_sign_in_at, type: DateTime
  property :last_sign_in_at, type: DateTime
  property :current_sign_in_ip, type: String
  property :last_sign_in_ip, type: String

  ## Lockable
  property :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  property :unlock_token, type: String # Only if unlock strategy is :email or :both
  property :locked_at, type: DateTime
end
