require 'shared_user'

class User
  include Neo4j::ActiveNode
  include ActiveModel::Validations
  extend ::Devise::Models
  extend ::Devise::Orm::Neo4j::Hook

  property :username, :type =>   String
  property :facebook_token, :type => String, :index => :exact
  property :id

  property :created_at, :type => DateTime
  property :updated_at, :type => DateTime
  
  ## Database authenticatable
  property :email, :type => String, :null => false, :default => "", :index => :exact
  property :encrypted_password, :type =>  String
  
  ## Rememberable
  property :remember_created_at, :type => DateTime
   
  ## Recoverable
  property :reset_password_token,   :type => String, :index => :exact
  property :reset_password_sent_at, :type => DateTime
  ## Trackable
  property :sign_in_count, :type => Integer, :default => 0
  property :current_sign_in_at, :type => DateTime
  property :last_sign_in_at, :type => DateTime
  property :current_sign_in_ip, :type =>  String
  property :last_sign_in_ip, :type => String

  ## Confirmable
  property :confirmation_token, :type => String, :index => :exact
  property :confirmed_at, :type => DateTime
  property :confirmation_sent_at, :type => DateTime
  
  ## Lockable
  property :failed_attempts, :type => Integer, :default => 0
  property :locked_at, :type => DateTime
  property :unlock_token, :type => String, :index => :exact

  ## Token authenticatable
  property :authentication_token, :type => String, :null => true, :index => :exact
  

  include Shim
  include SharedUser
  
end