require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
    should belong_to(:employee)
    should belong_to(:store)
end
