module Contexts 

   def create_employees
      @alex = FactoryBot.create(:employee, date_of_birth: 16.years.ago.to_date)
      @rachel = FactoryBot.create(:employee, first_name: "Rachel", active: false, ssn:"123123123", date_of_birth: 17.years.ago.to_date)
      @mark = FactoryBot.create(:employee, first_name: "Mark", ssn: "123123456", role: "admin")
      @juan = FactoryBot.create(:employee, first_name: "Juan", active: false, ssn: "123456789", role: "manager")
   end
  
   def remove_employees
      @alex.destroy
      @rachel.destroy
      @mark.destroy
      @juan.destroy
   end
        
   def create_stores
      @cmu = FactoryBot.create(:store)
      @park = FactoryBot.create(:store, name: "Park", active: false)
      @studio = FactoryBot.create(:store, name: "Studio")
   end
  
   def remove_stores
      @cmu.destroy
      @park.destroy
      @studio.destroy
   end

   def create_assignments
      @a1 = FactoryBot.create(:assignment, employee: @alex, store: @cmu, start_date: 1.month.ago.to_date)
      @m1 = FactoryBot.create(:assignment, employee: @mark, store: @park, pay_level: 6)
      @r1 = FactoryBot.create(:assignment, employee: @rachel, store: @cmu, pay_level: 3, end_date: 1.day.ago.to_date)
      @a2 = FactoryBot.create(:assignment, employee: @alex, store: @studio, end_date: 1.month.ago.to_date)
   end
  
   def remove_assignments
      @a1.destroy
      @m1.destroy
      @r1.destroy
      @a2.destroy
   end
end