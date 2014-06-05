require 'shared_user'

class User
  include Neo4j::ActiveNode
  include Shim
  include SharedUser


  property :username,       type: String
  property :facebook_token, type: String, index: :exact
#  property :id

  ## Database authenticatable
  property :email,              type: String, default: '', null: false, index: :exact
  property :encrypted_password, type: String, default: ''
  
  ## Recoverable
  property :reset_password_token,   type: String, index: :exact
  property :reset_password_sent_at, type: DateTime

  ## Rememberable
  property :remember_created_at, type: DateTime

  ## Trackable
  property :sign_in_count,      type: Integer, default: 0
  property :current_sign_in_at, type: DateTime
  property :last_sign_in_at,    type: DateTime
  property :current_sign_in_ip, type: String
  property :last_sign_in_ip,    type: String

  ## Confirmable
  property :confirmation_token,   type: String, index: :exact
  property :confirmed_at,         type: DateTime
  property :confirmation_sent_at, type: DateTime
#  property :unconfirmed_email,   type: String  # Only if using reconfirmable

  ## Lockable
  property :failed_attempts, type: Integer, default: 0
  property :unlock_token,    type: String, index: :exact
  property :locked_at,       type: DateTime

  property :created_at, type: DateTime
  property :updated_at, type: DateTime

end

UserAdapter  = User.to_adapter unless User.is_a?(OrmAdapter::Base)

