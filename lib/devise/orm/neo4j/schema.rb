module Devise
  module Orm
    module Neo4j
      module Schema
        include Devise::Schema

        INDEXED_PROPERTIES = [ :email, :authentication_token, :confirmation_token, :remember_token, :reset_password_token, :unlock_token ]
  
        # Tell how to apply schema methods
        def apply_devise_schema(name, type, options={})
          index name, :type => :exact if INDEXED_PROPERTIES.include?(name)
          create_property(name, type, options)
        end
        
        protected
        def create_property(name, type, options)
          # Hack to get around encrypted_password not having the default of ""
          options.delete(:default) if name == :encrypted_password
          
          # If the property is required, its presence should be checked anyway
          options.delete(:null)
          
          property name, { :type => map_type(type) }.merge!(options)
        end

        # map the Java type to the right Ruby type
        def map_type(type)
          case type.to_s
          when "DateTime"
            Time
          when "Integer"
            Fixnum
          else 
            type
          end
        end
      end
    end
  end
end
