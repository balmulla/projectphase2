require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  #Association tests
  should have_many(:assignments)
  should have_many(:employees).through(:assignments)
end
