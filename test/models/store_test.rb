require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  #Association tests
  #should have_many(:assignments)
  #should have_many(:employees).through(:assignments)
  
  #validation tests
  # should validate_presence_of(:name) 
  # should validate_presence_of(:street)
  # should validate_presence_of(:zip) 
  
  #latitude could be between -90 and +90
  # should allow_value(40.453278).for(:latitude)
  # should allow_value(-40.453278).for(:latitude)
  # should_not allow_value("string").for(:latitude)
  # should_not allow_value(-91).for(:latitude)
  # should_not allow_value(91).for(:latitude)
  
  #longitude could be between -180 and +180
  # should allow_value(40.453278).for(:longitude)
  # should allow_value(-40.453278).for(:longitude)
  # should_not allow_value("string").for(:longitude)
  # should_not allow_value(-181).for(:longitude)
  # should_not allow_value(181).for(:longitude)
  
  # should allow_value("4122688211").for(:phone)
  # should allow_value("412-268-8211").for(:phone)
  # should_not allow_value("hello").for(:phone)
  # should_not allow_value("412-268_8211").for(:phone)
  # should_not allow_value("412-268h8211").for(:phone)
  # should_not allow_value("412-268$8211").for(:phone)
  
  #zip code must be a 5 digit number in a string format
  # should allow_value("12345").for(:zip)
  # should allow_value("34542").for(:zip)
  # should_not allow_value("hello").for(:zip)
  # should_not allow_value("23-231").for(:zip)
  # should_not allow_value("12d431").for(:zip)
  # should_not allow_value("123456").for(:zip)
  
  # should allow_value("PA").for(:state)
  # should allow_value("OH").for(:state)
  # should allow_value("WV").for(:state)
  # should_not allow_value("412").for(:state)
  # should_not allow_value("NY").for(:state)
  # should_not allow_value("Pisds").for(:state)  
  
  # should validate_uniqueness_of(:name)
  
  context "Creating a set of stores" do
    setup do
      create_stores

    end
        
    teardown do
       remove_stores
    end
    
    should "have a scope to order alphabetically by store name" do
      assert_equal ["CMU","Park","CMU1"],Store.alphabetically.map{|c| c.name}
    end
     
  end
end
