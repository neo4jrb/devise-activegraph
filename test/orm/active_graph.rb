require 'fileutils'

def create_driver
server_url = ENV['NEO4J_URL'] || 'bolt://localhost:7687'
  ActiveGraph::Base.driver =
    Neo4j::Driver::GraphDatabase.driver(server_url, Neo4j::Driver::AuthTokens.none, encryption: false)
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
