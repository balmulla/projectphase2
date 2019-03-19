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
    
    #scope tests
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
        
        should "have a scope 'chronological' which orders assignments chronologically with the most recent assignments listed first" do
            assert_equal [1.month.ago.to_date, 2.month.ago.to_date, 3.month.ago.to_date, 1.year.ago.to_date], Assignment.chronological.map{|c| c.start_date}
        end
    
        should "have a scope 'current' which returns all the assignments that are considered current" do
            assert_equal [1.month.ago.to_date, 2.month.ago.to_date], Assignment.current.chronological.map{|c| c.start_date}
        end
        
        should "have a scope 'past' which returns all the assignments that have terminated" do
            assert_equal [3.month.ago.to_date, 1.year.ago.to_date], Assignment.past.chronological.map{|c| c.start_date}
        end
        
        should "have a scope 'for_store' which returns all assignments that are associated with a given store (parameter: store_id)" do
            assert_equal [1.month.ago.to_date, 3.month.ago.to_date], Assignment.for_store(@cmu).chronological.map{|c| c.start_date}
        end
        
        should "have a scope'for_employee' which returns all assignments that are associated with a given employee (parameter: employee_id)" do
            assert_equal [1.month.ago.to_date, 1.year.ago.to_date], Assignment.for_employee(@alex).chronological.map{|c| c.start_date}
        end
        
        should "have a scope 'for_pay_level' which returns all assignments that are associated with a given pay_level (parameter: pay_level)" do
            assert_equal [1.month.ago.to_date, 1.year.ago.to_date], Assignment.for_pay_level(1).chronological.map{|c| c.start_date}
        end
        
        should "have a scope 'for_role' -- which returns all assignments that are associated with employees of a given role (parameter: role)" do
            assert_equal [1.month.ago.to_date, 3.month.ago.to_date, 1.year.ago.to_date], Assignment.for_role("employee").chronological.map{|c| c.start_date}
        end
        
        should "have a scope 'by_store' which assignments values by store" do
            assert_equal [1.month.ago.to_date, 3.month.ago.to_date, 2.month.ago.to_date, 1.year.ago.to_date ], Assignment.by_store.chronological.map{|c| c.start_date}
        end
        
        should "have a scope 'by_employee' which assignments values by employee name (last, first)" do
            assert_equal [3.month.ago.to_date, 1.month.ago.to_date, 1.year.ago.to_date, 2.month.ago.to_date ], Assignment.by_employee.chronological.map{|c| c.start_date}
        end
        
        
    end
end
