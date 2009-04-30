require File.join(File.dirname(__FILE__), "..", "lib", "fetchapi")
include FetchAPI

describe Order do
  it "should find by id" do
    Order.find('1001').id.should == '1001'
  end

  it "should update title" do
	order = Order.find('1001')
	order.update(:title => "Updated Title")
	order = Order.find('1001')
	order.title.should == "Updated Title"
  end

  it "should create a new order" do
	Order.create(:id => "1015", :title => "Test Order", :first_name => "Donald", :last_name => "Duck", :email => "donald@duck.com", :download_limit => "4")
	order = Order.find('1015')
	order.id.should == "1015"
  end 
  
  it "should find all" do
    Order.find(:all).length.should > 0
  end
end