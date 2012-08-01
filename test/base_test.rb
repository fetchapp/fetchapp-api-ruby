require 'test_helper'

class BaseTest < Test::Unit::TestCase

  def setup
    @key = "demokey"
    @token = "demotoken"
    @url = "apitest.fetchapp.com"
  end

  def teardown
    FakeWeb.allow_net_connect = false
  end

  def test_basic_auth_no_url
    FetchAppAPI::Base::Connector.expects(:base_uri).with('app.fetchapp.com/api/v2')
    FetchAppAPI::Base::Connector.expects(:basic_auth).with(@key, @token)

    FetchAppAPI::Base.basic_auth(:key => @key, :token => @token)

  end

  def test_basic_auth

    FetchAppAPI::Base::Connector.expects(:base_uri).with(@url + '/api/v2')
    FetchAppAPI::Base::Connector.expects(:basic_auth).with(@key, @token)

    FetchAppAPI::Base.basic_auth(:url => @url, :key => @key, :token => @token)
  end

  def test_key

    api = FetchAppAPI::Base.basic_auth(:key => @key, :token => @token)
    assert_equal  FetchAppAPI::Base.key, @key

  end


end