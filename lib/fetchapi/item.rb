module FetchAPI
  class Item < FetchAPI::Base
	attr_accessor :id, :attributes

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
      return FetchAPI::Item.new(execute(:post, "/items/create", :item => options)["item"])
    end

    #--
    ################# Instance Methods ###############
    #--

    def destroy
      delete("/items/#{sku}/delete")
    end

    def update(options)
      self.attributes = put("/items/#{sku}", :item => options)["item"]
		self.id = self.sku
    end

	 def downloads
		downloads = get("/items/#{sku}/downloads")
		if downloads
			downloads["downloads"].map { |data| FetchAPI::Download.new(data) }
		end
	 end


  end
end
