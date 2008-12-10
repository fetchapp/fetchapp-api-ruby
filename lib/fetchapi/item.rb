module FetchAPI
  class Item
    include HTTParty
    base_uri 'http://demo.fetchapp.com/api'
  
    attr_reader :sku
    def initialize(data)
      case data
      when Fixnum
        @sku = sku
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
        self.get('/items')
      when Fixnum
        self.new(selector)
      end
    end
  
    def self.create(options)
      self.post("/items/create", options)
    end
  
  protected
    def data
      @data ||= self.get("/items/#{sku}")
    end
  
    def method_missing(method)
      if (data.has_key? method)
        data[method]
      else
        super
      end
    end
  end
end