module Contexts
    module StoreContexts
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
    end
end