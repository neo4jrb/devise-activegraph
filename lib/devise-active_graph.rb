require 'devise'
require 'active_graph'
require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.ignore(File.expand_path('devise-active_graph.rb', __dir__))
loader.ignore(File.expand_path('./devise/active_graph/version.rb', __dir__))
loader.ignore(File.expand_path('./generators', __dir__))
loader.setup
loader.eager_load
ActiveGraph::Node::ClassMethods.send :include, Devise::Models
ActiveGraph::Node::ClassMethods.send :include, Devise::Orm::ActiveGraph::CounterIncrement
