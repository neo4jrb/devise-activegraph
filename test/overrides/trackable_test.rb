require 'test_helper'
require 'models/trackable_test'

class TrackableTest < ActiveSupport::TestCase
  undef :"test_update_tracked_fields!_should_not_persist_invalid_records"
end
