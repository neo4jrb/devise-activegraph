require 'fileutils'

# mostly copied from neo4j/spec/spec_helper

EMBEDDED_DB_PATH = File.join(Dir.tmpdir, "neo4j-core-java")

I18n.enforce_available_locales = false

def create_session
  if RUBY_PLATFORM != 'java'
    create_server_session
  else
    require "neo4j-embedded/embedded_impermanent_session"
    create_embedded_session
  end
end

def create_embedded_session
  session = Neo4j::Session.open(:impermanent_db, EMBEDDED_DB_PATH, auto_commit: true)
  session.start
end

def create_server_session
  Neo4j::Session.open(:server_db, "http://localhost:7474")
  delete_db
end

FileUtils.rm_rf(EMBEDDED_DB_PATH)

Dir["#{File.dirname(__FILE__)}/shared_examples/**/*.rb"].each { |f| require f }

def delete_db
  Neo4j::Session.current._query('MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r')
end

class ActiveSupport::TestCase
  setup do
    Neo4j::Session.current.close if Neo4j::Session.current
    create_session
    curr_session = Neo4j::Session.current
  end
end
