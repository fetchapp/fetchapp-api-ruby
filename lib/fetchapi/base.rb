module FetchAPI
  class Base

    def initialize(id_or_attributes)
      case id_or_attributes
      when Integer, String
        @attributes = get("/#{self.class.pluralized_class_name}/#{id_or_attributes.to_s}")
        @attributes = @attributes[self.class.singularized_class_name]
        @id = @attributes['id']
      when Hash
        @attributes = id_or_attributes
        @id = id_or_attributes['id']
      end
    end

    def self.find(selector, params={})
      case selector
      when :all
        objects = execute(:get, "/#{pluralized_class_name}")

        if objects[pluralized_class_name].blank?
          return []
        else
          objects[pluralized_class_name].map { |data| new(data) }
        end
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
		@key = key # Save this in case they generate a new token
      Connector.base_uri(url)
      Connector.basic_auth(key, token)
    end

    protected
    def self.singularized_class_name
      ancestors.first.to_s.split('::').last.downcase
    end
    def self.pluralized_class_name
      ancestors.first.to_s.split('::').last.downcase << 's'
    end

    def post(*args);   self.class.execute(:post, *args); end
    def get(*args);    self.class.execute(:get, *args); end
    def delete(*args); self.class.execute(:delete, *args); end
    def put(*args);    self.class.execute(:put, *args); end

    # Do HTTP request, handle errors
    def self.execute(action, path, options = {})
      handle_response(Connector.send(action, path, :query => options))
      #Connector.send(action, path, options)
    end

    def self.handle_response(response)
      case response.code
      when 100..199 then response
      when 200..299 then response
      when 300.399 then
        raise(response.messsage)
      when 400..499 then
        raise(response.message)
      when 500..599 then
        raise(response.message)
      else
        raise("Unknown Response")
      end

    end


    # Access attributes as class methods of the Item object
    def method_missing(method)
      return super unless attributes.has_key?(method.to_s)
      attributes[method.to_s]
    end
  end
end
