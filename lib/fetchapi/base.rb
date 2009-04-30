module FetchAPI
  class Base
    def initialize(uid_or_attributes)
      case uid_or_attributes
      when Integer, String
        @uid = uid_or_attributes
      when Hash
        @attributes = uid_or_attributes
        @attributes['order_id'] = @attributes.delete('id') if @attributes.has_key?('id')
      end
    end

    def self.find(selector)
      case selector
      when :all
        execute(:get, "/#{pluralized_class_name}")[pluralized_class_name].map { |data| new(data) }
      when Integer, String
        new(selector)
      end
    end

    class Connector
      include HTTParty
      #base_uri 'http://demo.fetchapp.com/api'
      #basic_auth 'demokey', 'demotoken'
      format :xml
    end

    def self.basic_auth(url, key, token)
		Connector.base_uri = url
      Connector.basic_auth(key, token)
    end

    protected
    def self.pluralized_class_name
      ancestors.first.to_s.split('::').last.downcase << 's'
    end

    # Fetch Item details if needed
    def attributes
      @attributes ||= begin
        results = get("/#{self.class.pluralized_class_name}/#{@uid}")

        # Handle bad data/parsing
        throw error if !results.has_key? 'item'

        results['item']
      end
    end

    def post(*args);   self.class.execute(:post, *args); end
    def get(*args);    self.class.execute(:get, *args); end
    def delete(*args); self.class.execute(:delete, *args); end
    def put(*args);    self.class.execute(:put, *args); end

    # Do HTTP request, handle errors
    def self.execute(action, path, options = {})
      Connector.send(action, path, options)

      # Handle HTTP error
    rescue Net::HTTPServerException
      #if 401/Forbidden
      throw "Incorrect login credentials"

      # Handle failed login
      #rescue LoginError
      #throw correct error
    end

    # Access attributes as class methods of the Item object
    def method_missing(method)
      return super unless attributes.has_key?(method.to_s)
      attributes[method.to_s]
    end
  end
end
