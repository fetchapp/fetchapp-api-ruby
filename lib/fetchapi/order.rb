module FetchAPI
  class Order < Base
    def destroy!
      delete("/orders/#{id}/delete")
    end
  
    def expire!
      post("/orders/#{id}/expire")
    end
  
    def send_email(options)
      post("/orders/#{id}/send_email", options)
    end
  
    def update(options)
      post("/orders/#{id}/update", options)
    end
  
    def self.create(options)
      post("/orders/create", options)
    end
  end
end