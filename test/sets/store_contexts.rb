module Contexts
    module StoreContexts
        def create_stores
            @cmu = FactoryBot.create(:store)
            @park = FactoryBot.create(:store, name: "Park", active: 0)
            @store = FactoryBot.create(:store, name: "Store")
        end
  
        def destroy_stores
            @cmu.destroy
            @park.destroy
            @store.destroy
        end
    end
end