require 'test_helper'
require 'tmpdir'
require 'rails/generators/test_case'
require 'generators/neo4j/devise_generator.rb'

class Neo4j::Generators::ModelGeneratorTest < Rails::Generators::TestCase
  tests Neo4j::Generators::DeviseGenerator
  destination File.join(Dir.tmpdir, File.dirname(__FILE__))
  setup :prepare_destination

  def assert_class(klass, content)
    assert content =~ /class #{klass}(\(.+\))?(.*?)\nend/m, "Expected to have class #{klass}"
    yield $2.strip if block_given?
  end

  test "invoke with model name" do
    content = run_generator %w(Player)

    assert_file "app/models/player.rb" do |player|
      assert_class "Player", player do |klass|
        assert_match /Neo4j::ActiveNode/, klass
      end
    end
  end
end
