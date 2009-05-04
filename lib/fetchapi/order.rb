module FetchAPI

  class Order < FetchAPI::Base
    attr_accessor :id, :attributes

    #--
    ################ Class Methods ###############
    #--
    
	 # Finds an Order or orders based on the specified parameters
	 # :all, :current, :manual, :expired, or by ID
    def self.find(selector, params={})
      case selector
      when :current
        params.merge!(:filter => "current")
        orders = execute(:get, "/orders?#{params.to_params}")
        if orders["orders"].blank?
          return []
        else
          orders["orders"].map { |data| new(data) }
        end
      when :manual
        params.merge!(:filter => "manual")
        orders = execute(:get, "/orders?#{params.to_params}")
        if orders["orders"].blank?
          return []
        else
          orders["orders"].map { |data| new(data) }
        end
      when :expired
        params.merge!(:filter => "expired")
        orders = execute(:get, "/orders?#{params.to_params}")
        if orders["orders"].blank?
          return []
        else
          orders["orders"].map { |data| new(data) }
        end
      else
        super
      end
    end

    # Creates a new Order
    def self.create(options={})
      return FetchAPI::Order.new(execute(:post, "/orders/create", :order => options)["order"])
    end

    #--
    ################# Instance Methods ###############
    #--

    # Permanently deletes the Order
    def destroy
      delete("/orders/#{id}/delete")
    end

    # Sets the expiration date to Time.now, stopping future downloads
    def expire
      post("/orders/#{id}/expire")
    end

    # Delivers the email containing the download instructions.
    # Optional params:
    #   reset_expiration (true/false):  Reset the order's expiration. Defaults to true.
    #   expiration_date (2009-04-30T15:03:46+00:00): Manually sets the order's expiration date
    def send_email(options={})
      post("/orders/#{id}/send_email", options)
    end

    # Immediately updates the Order with the new parameters
    def update(options={})
      self.attributes = put("/orders/#{id}", :order => options)["order"]
    end
    
	 # Returns all the downloads associated with this Order
    def downloads(params={})
      downloads = get("/orders/#{id}/downloads")
      if downloads
        downloads["downloads"].map { |data| FetchAPI::Download.new(data) }
      end
    end

  end
end
