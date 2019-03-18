module Contexts
    module EmployeeContexts
        def create_employees
            @alex = FactoryBot.create(:employee, date_of_birth: 16.years.ago.to_date)
            @rachel = FactoryBot.create(:employee, first_name: "Rachel", active: 0, ssn:"123123123", date_of_birth: 17.years.ago.to_date)
            @mark = FactoryBot.create(:employee, first_name: "Mark", ssn: "123123456", role: "admin")
            @juan = FactoryBot.create(:employee, first_name: "juan", active: 0, ssn: "123456789", role: "manager")
        end
  
        def destroy_employees
            @alex.destroy
            @rachel.destroy
            @mark.destroy
            @juan.destroy
        end
    end
end