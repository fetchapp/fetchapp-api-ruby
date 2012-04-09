module FetchAPI
  class Account < FetchAPI::Base
   attr_accessor :attributes
    #--
    ################ Class Methods ###############
    #--

    # Retrieves information about the Account
    def self.details
    account = Account.new({})
    account.attributes = execute(:get, "/account")["account"]
    account
    end

    # Generates a new API token.  Subsequent API calls using the
    # existing token will be refused.
    def self.new_token
      token = execute(:get, "/new_token")
      unless token["message"].nil? || token["message"].empty?
        # Reauthorize
        Connector.basic_auth(FetchAPI::Base.key, token["message"])
        token
      end
    end
  end
end
