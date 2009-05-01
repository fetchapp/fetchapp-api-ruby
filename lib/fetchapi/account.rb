module FetchAPI
  class Account < FetchAPI::Base
    #--
    ################ Class Methods ###############
    #--

    # Retrieves information about the Account
    def self.details
      new(execute(:get, "/account"))
    end

    # Generates a new API token.  Subsequent API calls using the
    # existing token will be refused.
    def self.new_token
      token = execute(:get, "/new_token")
      unless token["message"].blank?
        # Reauthorize
		  puts "XXXXXXXX #{token["message"]}"
		  Connector.basic_auth(@key, token["message"])
        token
      end
    end

  end

end
