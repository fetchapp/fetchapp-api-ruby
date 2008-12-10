require File.join(File.dirname(__FILE__), "..", "lib", "fetchapi")
include FetchAPI

describe Item do
  it "should find by id" do
    Item.find('00001').sku.should == '00001'
  end
  
  it "should find all" do
    Item.find(:all).length.should > 0
  end
end