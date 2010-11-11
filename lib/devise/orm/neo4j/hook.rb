module Devise
	module Orm
		module Neo4j
			module Hook
				def devise_modules_hook!
          extend Schema
          devise_modules.each { |m| send(m) if respond_to?(m, true) }
          yield
        end
      end
		end
	end
end
