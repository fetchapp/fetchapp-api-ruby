module FetchAppAPI
  class Product < FetchAppAPI::Base
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

    # Find :all products or a specific SKU
    def self.find(selector, params={})
      super(selector, params)
    end


    # Creates a new Product
    def self.create(options)
      return FetchAppAPI::Product.new(execute(:post, "/products/create", :product => options)["product"])
    end

    #--
    ################# Instance Methods ###############
    #--

    # Permanently deletes the Product
    def destroy
      delete("/products/#{self.sku}/delete")
    end

    # Immediately updates the Product
    def update(options)
      self.attributes = put("/products/#{self.sku}", :product => options)["product"]
      self.id = self.sku
    end

    # Returns all the downloads associated with this Product
    def downloads
      downloads = get("/products/#{sku}/downloads")
      if downloads
        downloads["downloads"].map { |data| FetchAppAPI::Download.new(data) }
      end
    end

    # Returns all the downloads associated with this Product
    def files
      files = get("/products/#{sku}/files")
      if files
        files["files"].map { |data| FetchAppAPI::File.new(data) }
      end
    end

    # Returns stats about this Product
    def stats
      stats = get("/products/#{sku}/stats")
      if stats
        FetchAppAPI::Product.new(stats["product"])
      end
    end

  end
end
