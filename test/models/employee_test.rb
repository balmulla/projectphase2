require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  #Association tests
  should have_many(:assignments)
  should have_many(:stores).through(:assignments)

  #Validation tests
  should validate_presence_of(:first_name) 
  should validate_presence_of(:last_name)
  should validate_presence_of(:date_of_birth) 
  should validate_presence_of(:role)
  should validate_presence_of(:ssn) 
  
  should allow_value(16.year.ago.to_date).for(:date_of_birth)
  should_not allow_value("string").for(:date_of_birth)
  should_not allow_value(123232).for(:date_of_birth)
  
end
