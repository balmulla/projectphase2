module Contexts
    module StoreContexts
        def create_stores
            @cmu = FactoryBot.create(:store)
            #puts @cmu
            @park = FactoryBot.create(:store, name: "Park", active: false)
            @cmu1 = FactoryBot.create(:store, name: "CMU1")
            puts @cmu
            puts @park
            puts @cmu1
        end
  
        def remove_stores
            #puts @cmu
            @cmu.destroy
            @park.destroy
            @cmu1.destroy
        end
    end
end