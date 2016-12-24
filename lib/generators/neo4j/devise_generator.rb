require 'generators/devise/orm_helpers'

module Neo4j
  module Generators
    class DeviseGenerator < ::Rails::Generators::NamedBase
      include ::Devise::Generators::OrmHelpers

      def copy_devise_migration
        file_path = "db/neo4j/migrate/#{Time.now.utc.strftime('%Y%m%d%H%M%S')}_devise_create_user_constraints_and_indexes.rb"
        text = File.read(File.expand_path('./templates/migration.rb.erb', File.dirname(__FILE__)))
        label_string = name
        create_file file_path, ERB.new(text).result(binding)
      end

      def generate_model
        invoke 'neo4j:model', [name] unless model_exists? && behavior == :invoke
      end

      def inject_field_types
        inject_into_file model_path, model_contents , after: /Neo4j::ActiveNode\n/ if model_exists?
      end

      def inject_devise_content
        inject_into_file model_path,  migration_data , after: /Neo4j::ActiveNode\n/ if model_exists?
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

  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  ## Database authenticatable
  property :email, type: String, default: ''
  validates :email, presence: true

  property :encrypted_password

  ## If you include devise modules, uncomment the properties below.

  ## Recoverable
  property :reset_password_token
  property :reset_password_sent_at, type: DateTime

  ## Rememberable
  property :remember_created_at, type: DateTime

  ## Trackable
  property :sign_in_count, type: Integer, default: 0
  validates :sign_in_count, presence: true
  property :current_sign_in_at, type: DateTime
  property :last_sign_in_at, type: DateTime
  property :current_sign_in_ip, type:  String
  property :last_sign_in_ip, type: String

  ## Confirmable
  # property :confirmation_token
  # property :confirmed_at, type: DateTime
  # property :confirmation_sent_at, type: DateTime
  # property :unconfirmed_email # Only if using reconfirmable

  ## Lockable
  # property :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # validates :failed_attempts, presence: true
  # property :unlock_token, type: String # Only if unlock strategy is :email or :both
  # property :locked_at, type: DateTime

  ## Token authenticatable
  # property :authentication_token, type: String

RUBY
      end

      def rails5?
        Rails.version.start_with? '5'
      end

      def migration_version
        if rails5?
          "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
        end
      end
    end
  end
end
