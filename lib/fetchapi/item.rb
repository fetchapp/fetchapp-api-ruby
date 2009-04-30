module FetchAPI
  class Item < FetchAPI::Base
	
	 def initialize(id_or_attributes)
      case id_or_attributes
      when Integer, String
        @id = id_or_attributes
		  @attributes = get("/#{self.class.pluralized_class_name}/#{@sku}")
      when Hash
		  @id = id_or_attributes[:sku]
        @attributes = id_or_attributes
      end
    end  
	
    def destroy
      delete("/items/#{sku}/delete")
    end
  
    def update(options)
      put("/items/#{sku}", options)
    end
  
    def self.create(options)
      post("/items/create", options)
    end
  end
end