require 'fileutils'

Neo4j.shutdown
FileUtils.rm_rf Neo4j::Config[:storage_path]
Neo4j.start

class ActiveSupport::TestCase
  teardown do
    Neo4j.started_db.graph.getAllNodes.each do |n| 
      Neo4j::Transaction.run do
        unless n.id == 0
          n.rels.each { |r| r.delete unless r.nil? }
          n.delete unless n.nil?
        end
      end
    end
  end
end
