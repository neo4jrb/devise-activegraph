require 'devise-neo4j'
require 'devise/orm/neo4j/date_time'
require 'devise/orm/neo4j/nil_class_converter'

ActiveGraph::Node::ClassMethods.send :include, Devise::Models

