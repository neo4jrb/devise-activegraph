require 'devise-neo4j'
require 'orm_adapter/adapters/neo4j'
require 'devise/orm/neo4j/date_time'
require 'devise/orm/neo4j/compatibility'
require 'devise/orm/neo4j/nil_class_converter'

module Neo4j
  module Rails
    class Model
      include ActiveModel::Validations
      extend ::Devise::Models
      extend ::Devise::Orm::Neo4j::Hook
    end
  end
end


converters = [ Neo4j::TypeConverters::NilClassConverter ]
Neo4j::TypeConverters.constants.find_all do |c|
          converters <<  Neo4j::TypeConverters.const_get(c) if Neo4j::TypeConverters.const_get(c).respond_to?(:convert?)
end
Neo4j::TypeConverters.converters =  converters.uniq
