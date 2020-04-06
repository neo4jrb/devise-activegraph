# Workaround for missing zeitwerk support in jruby-9.2.8.0
if RUBY_PLATFORM.match?(/java/)
  module Devise
    module Orm
    end
    module ActiveGraph
    end
  end
end
# End workaround


require 'devise'
require 'active_graph'
require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect "version" => "VERSION"
loader.ignore(File.expand_path('devise-activegraph.rb', __dir__))
loader.ignore(File.expand_path('./generators', __dir__))
loader.setup
loader.eager_load
ActiveGraph::Node::ClassMethods.include Devise::Models
ActiveGraph::Node::ClassMethods.include Devise::Orm::ActiveGraph::CounterIncrement
