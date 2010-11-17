module Devise
	module Orm
		module Neo4j
			module Schema
				include Devise::Schema

        INDEXED_PROPERTIES = [ :email, :authentication_token, :confirmation_token, :remember_token, :reset_password_token, :unlock_token ]
	
				# Tell how to apply schema methods
				def apply_devise_schema(name, type, options={})
					type = Date if name == :confirmation_sent_at
					
          index name, :type => :exact if INDEXED_PROPERTIES.include?(name)
          create_property(name, type, options)
				end
				
				protected
				def create_property(name, type, options)
          options.delete(:null) # we'll ignore this option, as those properties will have :presence => true where needed anyway
          options.delete(:default) if options.has_key?(:default) && options[:default].blank? # we have to ignore the default "" too
          Rails.logger.debug "Adding Devise property for #{self}: #{name.inspect}, #{{ :type => map_type(type) }.merge!(options).inspect}"
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
