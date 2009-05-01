require File.join(File.dirname(__FILE__), "..", "lib", "fetchapi-ruby")
include FetchAPI

describe Order do
  before do
    Base.basic_auth('http://pixallent.myhost.dev:3000/api', 'pixallent', 'pixallent')
  end

  it "should update title" do
    order = Order.find('1001')
    order.update(:first_name => "Daffy")
    order = Order.find('1001')  
    order.first_name.should == "Daffy"
  end

  it "should create an order" do
	begin
	 Order.find('1015').destroy
	rescue
	end
    Order.create(:id => "1015", :title => "Test Order", :first_name => "Donald", :last_name => "Duck", :email => "donald@duck.com", :order_items => [{:sku => 'BIZCARD', :downloads_remaining => '6'}])
    order = Order.find('1015')
    order.id.to_s.should == "1015"
  end

  it "should delete an order" do
	Order.create(:id => "1016", :title => "Test Order", :first_name => "Donald", :last_name => "Duck", :email => "donald@duck.com", :download_limit => "4")
    order = Order.find('1016')
    order.destroy
    lambda {Order.find('1016')}.should raise_error("Not Found")
  end

  it "should find all" do
    Order.find(:all).length.should > 0
  end

	it "should find current" do
	  Order.find(:current).length.should > 0 
	end

	it "should find manual" do
	  Order.find(:manual).length.should > 0 
	end

	it "should find expired" do
	  Order.find(:expired).length.should > 0 
	end


end
