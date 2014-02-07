require 'devise-neo4j'
require 'devise/orm/neo4j/date_time'
require 'devise/orm/neo4j/compatibility'
require 'devise/orm/neo4j/nil_class_converter'

module Neo4j
  module ActiveNode
    include ActiveModel::Validations
    extend ::Devise::Models
    extend ::Devise::Orm::Neo4j::Hook
  end
end