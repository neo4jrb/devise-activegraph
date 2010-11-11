require 'devise-neo4j'

module Neo4j
  module Rails
    class Model
      extend ::Devise::Models
      extend ::Devise::Orm::Neo4j::Hook
    end
  end
end
