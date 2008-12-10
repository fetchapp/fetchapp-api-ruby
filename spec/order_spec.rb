require File.join(File.dirname(__FILE__), "..", "lib", "fetchapi")
include FetchAPI

describe Order do
  it "should find by id" do
    Order.find('0001').order_id.should == '0001'
  end
  
  it "should find all" do
    Order.find(:all).length.should > 0
  end
end