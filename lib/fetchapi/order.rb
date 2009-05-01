module FetchAPI

  class Order < FetchAPI::Base
    attr_accessor :id, :attributes

    #--
    ################ Class Methods ###############
    #--

    def self.find(selector, params={})
      case selector
      when :current
        params.merge!(:filter => "current")
        execute(:get, "/#{pluralized_class_name}?#{params.to_params}")[pluralized_class_name].map { |data| new(data) }
      when :manual
        params.merge!(:filter => "manual")
        execute(:get, "/#{pluralized_class_name}?#{params.to_params}")[pluralized_class_name].map { |data| new(data) }
      when :expired
        params.merge!(:filter => "expired")
        execute(:get, "/#{pluralized_class_name}?#{params.to_params}")[pluralized_class_name].map { |data| new(data) }
      else
        super
      end
    end

    # Creates a new order
    def self.create(options={})
      execute(:post, "/orders/create", :order => options)
    end

    #--
    ################# Instance Methods ###############
    #--

    # Permanently deletes the order
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

    # Immediately updates the order with the new parameters
    def update(options={})
      put("/orders/#{id}", :order => options)
    end


  end
end
