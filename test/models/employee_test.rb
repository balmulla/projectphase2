require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  #Association tests
  should have_many(:assignments)
  should have_many(:stores).through(:assignments) 
  
end
