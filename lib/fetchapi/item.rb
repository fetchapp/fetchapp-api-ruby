module FetchAPI
  class Item < FetchAPI::Base
    def destroy!
      delete("/items/#{sku}/delete")
    end
  
    def update(options)
      put("/items/#{sku}/items", options)
    end
  
    def self.create(options)
      post("/items/create", options)
    end
  end
end