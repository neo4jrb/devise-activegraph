require 'generators/devise/orm_helpers'

module Neo4j
  module Generators
    class DeviseGenerator < ::Rails::Generators::NamedBase
      include ::Devise::Generators::OrmHelpers
  
      def generate_model
        invoke "neo4j:model", [name] unless model_exists? && behavior == :invoke
      end
    

      def inject_field_types
        inject_into_file model_path, model_contents , :after => /Neo4j(::Rails)?::Model\n/ if model_exists?
      end

      def inject_devise_content
        inject_into_file model_path,  migration_data , :after => /Neo4j(::Rails)?::Model\n/ if model_exists?
      end
      
    
  def migration_data
<<RUBY 
  #
  # Neo4j.rb needs to have property definitions before any validations. So, the property block needs to come before 
  # loading your devise modules. 
  #
  # If you add another devise module (such as :lockable, :confirmable, or :token_authenticatable), be sure to 
  # uncomment the property definitions for those modules. Otherwise, the unused property definitions can be deleted. 
  #
  # Setup accessible attributes for your model
   attr_accessible :email, :password, :password_confirmation, :remember_me
  
   property :username, :type =>   String
   property :facebook_token, :type => String, :index => :exact

   property :created_at, :type => DateTime
   property :updated_at, :type => DateTime

   ## Database authenticatable
   property :email, :type => String, :null => false, :default => "", :index => :exact
   property :encrypted_password, :type =>  NilClass
   
   ## If you include devise modules, uncomment the properties below.
    
   ## Rememberable
   property :remember_created_at, :type => DateTime
   index :remember_token, :type => :exact

   
   ## Recoverable
   property :reset_password_token,   :type => NilClass, :index => :exact
   property :reset_password_sent_at, :type =>   DateTime
  
   ## Trackable
   property :sign_in_count, :type => Fixnum, :default => 0
   property :current_sign_in_at, :type => DateTime
   property :last_sign_in_at, :type => DateTime
   property :current_sign_in_ip, :type =>  String
   property :last_sign_in_ip, :type => String

   ## Confirmable
   # property :confirmation_token, :type => NilClass, :index => :exact
   # property :confirmed_at, :type => DateTime
   # property :confirmation_sent_at, :type => DateTime

   ## Lockable
   #  property :failed_attempts, :type => Fixnum, :default => 0
   # property :locked_at, :type => DateTime
   #  property :unlock_token, :type => String, :index => :exact

    ## Token authenticatable
    # property :authentication_token, :type => String, :null => true, :index => :exact

RUBY
    end
    
    
  end
  end
end
