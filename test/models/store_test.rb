require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  #Association tests
  should have_many(:assignments)
  should have_many(:employees).through(:assignments)
  
  #validation tests
  should validate_presence_of(:name) 
  should validate_presence_of(:street)
  should validate_presence_of(:zip) 
end
