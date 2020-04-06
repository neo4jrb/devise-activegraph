require 'fileutils'
require 'active_graph/core/driver'
require 'active_graph/core'
# mostly copied from neo4j/spec/spec_helper
class TestDriver < ActiveGraph::Core::Driver
  cattr_reader :cache, default: {}

  at_exit do
    close_all
  end

  class << self
    def new_instance(url, auth_token, options = {})
      cache[url] ||= super(url, auth_token, options.merge(encryption: false))
    end

    def close_all
      cache.values.each(&:close)
    end
  end

  def close; end
end


def create_driver
  server_url = ENV['NEO4J_URL'] || 'bolt://localhost:7687'
  ActiveGraph::Base.driver = TestDriver.new(server_url)
end


I18n.enforce_available_locales = false

Dir["#{File.dirname(__FILE__)}/shared_examples/**/*.rb"].each { |f| require f }

def delete_db
  Neo4j::ActiveBase.current_session.query('MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r')
end

class ActiveSupport::TestCase
  setup do
    create_driver
    ActiveGraph::Core::Label.drop_constraints
    ActiveGraph::Core::Label.drop_indexes
    ActiveGraph::Base.label_object(User.mapped_label_names.first).create_constraint(User.id_property_name, type: :unique)
    ActiveGraph::Base.label_object(Admin.mapped_label_names.first).create_constraint(Admin.id_property_name, type: :unique)
    ActiveGraph::Base.label_object(UserOnMainApp.mapped_label_names.first).create_constraint(UserOnMainApp.id_property_name, type: :unique)
    ActiveGraph::Base.label_object(UserOnEngine.mapped_label_names.first).create_constraint(UserOnEngine.id_property_name, type: :unique)
    ActiveGraph::Base.label_object(UserWithoutEmail.mapped_label_names.first).create_constraint(UserWithoutEmail.id_property_name, type: :unique)
    ActiveGraph::Base.query('MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r')
  end
end
