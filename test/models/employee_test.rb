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
  
  should allow_value("023649320").for(:ssn)
  should allow_value("023-64-9320").for(:ssn)
  should_not allow_value("hello").for(:ssn)
  should_not allow_value("sfs121").for(:ssn)
  should_not allow_value("121").for(:ssn)

  should allow_value("4122688211").for(:phone)
  should allow_value("412-268-8211").for(:phone)
  should_not allow_value("hello").for(:phone)
  should_not allow_value("412-268_8211").for(:phone)
  should_not allow_value("412-268h8211").for(:phone)
  should_not allow_value("412-268$8211").for(:phone)
  should allow_value(nil).for(:phone)
  
end
