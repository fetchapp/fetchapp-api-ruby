module FetchAppAPI
  class File < FetchAppAPI::Base
    attr_accessor :id, :attributes

   # Find :all files or the specified ID
   def self.find(selector, params={})
       super(selector, params)
    end

  end
end