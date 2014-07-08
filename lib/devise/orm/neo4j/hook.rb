require 'devise'
require 'devise/orm/neo4j/nil_class_converter'

module Devise
  module Orm
    module Neo4j
      module Hook
        
        def devise_modules_hook!
          include Compatibility
          yield
        end
        
      end
    end
  end
end

