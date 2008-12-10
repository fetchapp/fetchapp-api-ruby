module FetchAPI
  class Order
    include HTTParty
    base_uri 'http://demo.fetchapp.com/api'
    basic_auth 'demokey', 'demotoken'
    format :xml
  
    attr_reader :id
    def initialize(data)
      case data
      when Integer, String
        @id = data
      when Hash
        @id, @data = data['id'], data
      end
    end
  
    def destroy
      self.delete("/orders/#{id}/delete")
    end
  
    def expire
      self.post("/orders/#{id}/expire")
    end
  
    def send_email(options)
      self.post("/orders/#{id}/send_email", options)
    end
  
    def update(options)
      self.post("/orders/#{id}/update", options)
    end
  
    def self.find(selector)
      case selector
      when :all
        self.get('/orders')['orders'].map { |data| self.new(data) }
      when Integer, String
        self.new(selector)
      end
    end
  
    def self.create(options)
      self.post("/orders/create", options)
    end
  
  protected
    def data
      @data ||= self.class.get("/orders/#{id}")
    end
  
    def method_missing(method)
      if (data.has_key? method.to_s)
        data[method.to_s]
      else
        super
      end
    end
  end
end