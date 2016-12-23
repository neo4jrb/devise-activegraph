require 'shared_admin'

class Admin
  include Neo4j::ActiveNode
  include SharedAdmin

  ## Database authenticatable
  property :email, type: String
  property :encrypted_password, type: String

  ## Recoverable
  property :reset_password_token,   type: String
  property :reset_password_sent_at, type: DateTime

  ## Rememberable
  property :remember_created_at, type: DateTime

  ## Confirmable
  property :confirmation_token, type: String
  property :confirmed_at, type: DateTime
  property :confirmation_sent_at, type: DateTime
  property :unconfirmed_email, type: String

  ## Lockable
  property :locked_at, type: DateTime

  property :active, type: Boolean, default: false

  property :created_at, type: DateTime
  property :updated_at, type: DateTime

#  def active?
#    return self.active
#  end
end

AdminAdapter = Admin.to_adapter unless Admin.is_a?(OrmAdapter::Base)

