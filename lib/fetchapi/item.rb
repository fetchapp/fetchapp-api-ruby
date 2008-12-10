module FetchAPI
  class Item
    include HTTParty
    base_uri 'http://demo.fetchapp.com/api'
    basic_auth 'demokey', 'demotoken'
    format :xml
  
    attr_reader :sku
    def initialize(data)
      case data
      when Integer, String
        @sku = data
      when Hash
        @sku, @data = data['sku'], data
      end
    end
  
    def destroy
      self.delete("/items/#{sku}/delete")
    end
  
    def update(options)
      self.post("/items/#{sku}/items", options)
    end
  
    def self.find(selector)
      case selector
      when :all
        self.get('/items')['items'].map { |data| self.new(data) }
      when Integer, String
        self.new(selector)
      end
    end
  
    def self.create(options)
      self.post("/items/create", options)
    end
  
  protected
    def data
      @data ||= self.class.get("/items/#{sku}")['item']
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