require 'test_helper'
require 'mapping_test'

class MappingTest < ActiveSupport::TestCase
  undef :test_find_scope_works_with_single_table_inheritance

  test 'find scope works with single table inheritance' do
    assert_equal :user, Devise::Mapping.find_scope!(Class.new(User))
  end

end
