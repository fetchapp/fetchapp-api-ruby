require File.join(File.dirname(__FILE__), "..", "lib", "fetchapi-ruby")
include FetchAPI

describe Item do
  before do
    Base.basic_auth('http://pixallent.myhost.dev:3000/api', 'pixallent', 'pixallent')
  end


  it "should find by id" do
    i = Item.find('CATALOG').sku.should == "CATALOG"
  end

  it "should find all" do
    Item.find(:all).length.should > 0
  end
end
