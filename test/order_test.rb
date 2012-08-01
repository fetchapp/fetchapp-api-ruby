require 'test_helper'

class OrderTest < Test::Unit::TestCase

  def setup
    FetchAppAPI::Base.basic_auth({:key => 'demokey', :token => 'demotoken'})
    FakeWeb.register_uri(:post, "http://demokey:demotoken@app.fetchapp.com/api/v2/orders/create", :body => load_fixture('order'), :status => 200, :content_type => "text/xml")
    @order = FetchAppAPI::Order.create(:id => 1001)
  end

  def teardown
    FakeWeb.allow_net_connect = false
  end

  def test_destroy
    FakeWeb.register_uri(:delete, "http://demokey:demotoken@demo.fetchapp.com/api/v2/orders/1001/delete", :body => load_fixture('ok'), :status => 200, :content_type => "text/xml")

    @order.expects(:delete).with("/orders/1001/delete")
    @order.destroy
  end

end