require 'shared_admin'

class Admin < Neo4j::Rails::Model
  
  index :email, :type => :exact # this need to come before any validations

   property :created_at, :type => DateTime
   property :updated_at, :type => DateTime

   ## Database authenticatable
   property :email, :type => String, :null => true
   property :encrypted_password, :type =>  String, :null => true

 
   ## Recoverable
   property :reset_password_token,   :type => String
   property :reset_password_sent_at, :type =>   Time
   
   ## Confirmable
   property :confirmation_token, :type => NilClass, :null => true, :index => :exact
   property :confirmed_at, :type => DateTime
   property :confirmation_sent_at, :type => DateTime
   property :unconfirmed_email, :type => String

   ## Lockable
   property :locked_at, :type => DateTime
   
   property :active, :type => :boolean, :default => false
   
   def active?
     return self.active
   end
   
   include Shim
   include SharedAdmin
  
end