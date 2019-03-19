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
  
  context "Creating a set of stores" do
    setup do
      create_employees
      create_stores
      create_assignments

    end
        
    teardown do
      # remove_assignments
      remove_employees
      remove_stores
    end
    
    should "have a scope that orders employees alphabetically by first_name" do
      assert_equal ["Alex","Juan","Mark","Rachel"], Employee.alphabetical.map{|c| c.first_name}
    end
    
    should "have a scope to return all employees under 18" do
      assert_equal ["Alex","Rachel"],Employee.younger_than_18.alphabetical.map{|c| c.first_name}
    end
    
    should "have a scope to return all employees 18 years or older" do
      assert_equal ["Juan","Mark"],Employee.is_18_or_older.alphabetical.map{|c| c.first_name}
    end

    should "have a scope to return all active employees" do
      assert_equal ["Alex","Mark"],Employee.active.alphabetical.map{|c| c.first_name}
    end  
    
    should "have a scope to return all inactive employees" do
      assert_equal ["Juan","Rachel"],Employee.inactive.alphabetical.map{|c| c.first_name}
    end
    
    should "have a scope to return all employees with role employees" do
      assert_equal ["Alex","Rachel"],Employee.regulars.alphabetical.map{|c| c.first_name}
    end
    
    should "have a scope to return all employees with role manager" do
      assert_equal ["Juan"],Employee.managers.alphabetical.map{|c| c.first_name}
    end
    
    should "have a scope to return all employees with role admin" do
      assert_equal ["Mark"],Employee.admins.alphabetical.map{|c| c.first_name}
    end
    
    #methods
    should "have a method name which returns the employee name as a string last_name, first_name in that order" do
      assert_equal "Heimann, Alex", @alex.name
    end
    
    should "have a method proper_name which returns the employee name as a string first_name last_name in that order" do
      assert_equal "Alex Heimann", @alex.proper_name
    end
    
    should "have a method 'current_assignment' which returns the employee's current assignment" do
      assert_equal @a1, @alex.current_assignment
    end
    
    # should "have a method 'current_assignment' which returns nil if the employee does not have a current assignment." do
    #   assert_equal nil, @rachel.current_assignment
    # end
    
     
  end
  
end
