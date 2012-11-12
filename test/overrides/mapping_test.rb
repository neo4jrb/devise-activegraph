require 'test_helper'

class MappingTest < ActiveSupport::TestCase
  
  undef :test_find_scope_works_with_single_table_inheritance
    
  test 'find scope works with single table inheritance' do
    assert_equal :user, Devise::Mapping.find_scope!(Class.new(User))
#  Neo4j does not like mkaing user classes with the Class.new(User).new method
#    assert_equal :user, Devise::Mapping.find_scope!(Class.new(User).new)
  end

end
