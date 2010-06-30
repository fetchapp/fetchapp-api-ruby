module FetchAPI
  class Item < FetchAPI::Base
    attr_accessor :id, :attributes

    def initialize(id_or_attributes) #:nodoc:
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

    # Find :all items or a specific SKU
    def self.find(selector, params={})
      super(selector, params)
    end


    # Creates a new Item
    def self.create(options)
      return FetchAPI::Item.new(execute(:post, "/items/create", :item => options)["item"])
    end

    #--
    ################# Instance Methods ###############
    #--

    # Permanently deletes the Item
    def destroy
      delete("/items/#{sku}/delete")
    end

    # Immediately updates the Item
    def update(options)
      self.attributes = put("/items/#{sku}", :item => options)["item"]
      self.id = self.sku
    end

    # Returns all the downloads associated with this Item
    def downloads
      downloads = get("/items/#{sku}/downloads")
      if downloads
        downloads["downloads"].map { |data| FetchAPI::Download.new(data) }
      end
    end


  end
end
