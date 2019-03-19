require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
    #Association tests
    should belong_to(:employee)
    should belong_to(:store)
    
    #validation tests
    should validate_presence_of(:store_id) 
    should validate_presence_of(:employee_id)
    should validate_presence_of(:start_date) 
    should validate_presence_of(:pay_level)
    
    should allow_value(1.year.ago.to_date).for(:start_date)
    should allow_value(1.day.ago.to_date).for(:start_date)
    should_not allow_value("string").for(:start_date)
    should_not allow_value(123232).for(:start_date)
    
    should allow_value(1.year.ago.to_date).for(:end_date)
    should allow_value(1.day.ago.to_date).for(:end_date)
    should_not allow_value("string").for(:end_date)
    should_not allow_value(123232).for(:end_date)
    should allow_value(nil).for(:end_date)
    
    should validate_numericality_of(:pay_level)
    should_not allow_value(1.3).for(:pay_level)
    
    context "Creating a set of stores" do
        setup do
            create_employees
            create_stores
            create_assignments
        end
        
        teardown do
            remove_assignments
            remove_employees
            remove_stores
        end
        
        should "have a scope that orders employees alphabetically by first_name" do
            assert_equal ["Alex","Juan","Mark","Rachel"], Employee.alphabetical.map{|c| c.first_name}
        end
    end
end
