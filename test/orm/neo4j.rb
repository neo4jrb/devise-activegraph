require 'rails/test_help'
require 'fileutils'

Neo4j.shutdown
FileUtils.rm_rf Neo4j::Config[:storage_path]
Neo4j.start

class ActiveSupport::TestCase
  setup do
    Neo4j::Transaction.run do
      Neo4j._all_nodes.each { |n| n.del unless n == Neo4j.ref_node }
    end
  end
end
