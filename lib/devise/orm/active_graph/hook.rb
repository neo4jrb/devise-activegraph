module Devise
  module Orm
    module ActiveGraph
      module Hook
        
        def devise_modules_hook!
          include Compatibility
          yield
        end
        
      end
    end
  end
end

