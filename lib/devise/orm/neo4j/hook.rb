module Devise
  module Orm
    module Neo4j
      module Hook
        def devise_modules_hook!
          extend Schema
          yield
          devise_modules.each { |m| send(m) if respond_to?(m, true) }
          
          # ensure we have the created_at property
          property :created_at, :type => Time
        end
      
        # Overwrite the devise method to control indexation dependent on the specified modules
        def devise(*modules)
          # hack to get around Neo4j's requirement to index before uniqueness validation
          index :email, :type => :exact if modules.include?(:validatable)
          super
        end
      end
    end
  end
end
