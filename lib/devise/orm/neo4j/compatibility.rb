module Devise
  module Orm
    module Neo4j
      
      # This module is to add AR specific methods that devise is looking for
      
      module Compatibility
        extend ActiveSupport::Concern
        included do
                    
          def assign_attributes(new_attributes)
            attributes = sanitize_for_mass_assignment(new_attributes)
          end
        
        end
        
      
      end
    end
  end
end
