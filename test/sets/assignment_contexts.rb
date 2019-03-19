module Contexts
    module AssignmentContexts
        def create_assignments
            @a1 = FactoryBot.create(:assignment, child: @alex, store: @cmu, start_date: 1.month.ago.to_date)
            @m1 = FactoryBot.create(:assignment, child: @mark, store: @park, pay_level: 6)
            @r1 = FactoryBot.create(:assignment, child: @rachel, store: @cmu, pay_level: 3, end_date: 1.day.ago.to_date)
            @a2 = FactoryBot.create(:assignment, child: @alex, store: @studio, end_date: 1.month.ago.to_date)
        end
  
        def remove_assignments
            @a1.destroy
            @m1.destroy
            @r1.destroy
            @a2.destroy
        end
    end
  
end