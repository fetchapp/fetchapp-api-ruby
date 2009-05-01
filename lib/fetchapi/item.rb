module FetchAPI
  class Item < FetchAPI::Base
	attr_accessor :attributes

    def initialize(id_or_attributes)
      case id_or_attributes
      when Integer, String
        @attributes = get("/#{self.class.pluralized_class_name}/#{id_or_attributes.to_s}")
        @attributes = @attributes[self.class.singularized_class_name]
      when Hash
        @attributes = id_or_attributes
      end
    end

    #--
    ################ Class Methods ###############
    #--
    def self.create(options)
      execute(:post, "/items/create", :item => options)
    end

    #--
    ################# Instance Methods ###############
    #--

    def destroy
      delete("/items/#{sku}/delete")
    end

    def update(options)
      put("/items/#{sku}", :item => options)
    end


  end
end
