module FetchAPI
  class Account < FetchAPI::Base
    #--
    ################ Class Methods ###############
    #--    

    # Retrieves information about the Account
    def self.details
      execute(:get, "/account")
    end

    # Generates a new API token.  Subsequent API calls using the
    # existing token will be refused.
    def self.new_token
      execute(:get, "/new_token")
    end

  end

end
