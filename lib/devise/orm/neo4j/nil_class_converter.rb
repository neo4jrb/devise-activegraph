require 'neo4j'
class Neo4j::TypeConverters::NilClassConverter
  class << self
    def convert?(type)
      type == NilClass || type == :nilclass
    end

    def to_java(val)
      return nil if val.nil?
      return nil if val.empty?
      val
    end

    def to_ruby(val)
      return nil if val.nil?
      return nil if val.empty?
      val
    end

    def index_as
      String
    end
  end
end