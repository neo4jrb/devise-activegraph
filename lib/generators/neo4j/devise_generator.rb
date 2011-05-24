require 'generators/devise/orm_helpers'

module Neo4j
  module Generators
    class DeviseGenerator < ::Rails::Generators::NamedBase
      include ::Devise::Generators::OrmHelpers
      
      def generate_model
        invoke "neo4j:model", [name] unless model_exists? && behavior == :invoke
      end

      def inject_devise_content
        inject_into_file(model_path, model_contents + <<CONTENT, :after => /Neo4j(::Rails)?::Model\n/) if model_exists?
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
CONTENT
      end
    end
  end
end