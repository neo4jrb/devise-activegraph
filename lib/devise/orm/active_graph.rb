require 'devise-activegraph'
require 'devise/orm/active_graph/date_time'
require 'devise/orm/active_graph/nil_class_converter'
require 'devise/orm/active_graph/counter_increment'

ActiveGraph::Node::ClassMethods.send :include, Devise::Models

