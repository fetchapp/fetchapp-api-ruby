require 'test_helper'

class OrderTest < Test::Unit::TestCase

  def setup
    FetchAPI::Base.basic_auth('demo.fetchapp.com', 'demokey', 'demotoken')
    FakeWeb.register_uri(:post, "http://demokey:demotoken@demo.fetchapp.com/api/orders/create", :body => load_fixture('order'), :status => 200, :content_type => "text/xml")
    @order = FetchAPI::Order.create(:id => 1001)
  end

  def teardown
    FakeWeb.allow_net_connect = false
  end

  def test_destroy
    FakeWeb.register_uri(:delete, "http://demokey:demotoken@demo.fetchapp.com/api/orders/1001/delete", :body => load_fixture('ok'), :status => 200, :content_type => "text/xml")

    @order.expects(:delete).with("/orders/1001/delete")
    @order.destroy
  end

end