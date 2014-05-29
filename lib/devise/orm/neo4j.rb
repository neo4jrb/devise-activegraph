require 'devise-neo4j'
require 'devise/orm/neo4j/date_time'
require 'devise/orm/neo4j/compatibility'
require 'devise/orm/neo4j/nil_class_converter'

Neo4j::ActiveNode::ClassMethods.send :include, Devise::Models

