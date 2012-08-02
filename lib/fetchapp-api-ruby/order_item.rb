module FetchAppAPI

  class OrderItem < FetchAppAPI::Base
    attr_accessor :id, :attributes

    #--
    ################ Class Methods ###############
    #--

    # Finds an Order or orders based on the specified parameters
    # :all or by ID
    def self.find(selector, params={})
      super(selector, params)
    end

    #--
    ################# Instance Methods ###############
    #--

    # Sets the expiration date to Time.now, stopping future downloads
    def expire
      post("/orders/#{order_id}/order_items/#{id}/expire")
    end

    # Returns all the downloads associated with this Order
    def downloads(params={})
      downloads = get("/orders/#{order_id}/order_items/#{id}/downloads")
      if downloads
        downloads["downloads"].map { |data| FetchAppAPI::Download.new(data) }
      else
        return []
      end
    end

    def files(params={})
      files = get("/orders/#{order_id}/order_items/#{id}/files")
      if files
        files["files"].map { |data| FetchAppAPI::File.new(data) }
      else
        return []
      end
    end

  end
end
