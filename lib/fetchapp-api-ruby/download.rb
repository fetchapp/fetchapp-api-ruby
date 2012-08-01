module FetchAppAPI
  class Download < FetchAppAPI::Base
    attr_accessor :id, :attributes

   # Find :all downloads or the specified ID
   def self.find(selector, params={})
       super(selector, params)
    end

  end
end
