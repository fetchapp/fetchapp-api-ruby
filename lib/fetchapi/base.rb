module FetchAPI
  class Base

    def self.find(selector, params={})
      case selector
      when :all
        execute(:get, "/#{pluralized_class_name}")[pluralized_class_name].map { |data| new(data) }
      when Integer, String
        new(selector)
      end
    end

    class Connector
      include HTTParty
      format :xml
    end

    # Initializes the connection
    def self.basic_auth(url, key, token)
      Connector.base_uri(url)
      Connector.basic_auth(key, token)
    end

    protected
    def self.pluralized_class_name
      ancestors.first.to_s.split('::').last.downcase << 's'
    end

    def post(*args);   self.class.execute(:post, *args); end
    def get(*args);    self.class.execute(:get, *args); end
    def delete(*args); self.class.execute(:delete, *args); end
    def put(*args);    self.class.execute(:put, *args); end

    # Do HTTP request, handle errors
    def self.execute(action, path, options = {})
    	Connector.send(action, path, options)       
    end

    # Access attributes as class methods of the Item object
    def method_missing(method)
      return super unless attributes.has_key?(method.to_s)
      attributes[method.to_s]
    end
  end
end
