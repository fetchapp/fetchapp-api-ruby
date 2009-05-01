require File.join(File.dirname(__FILE__), "..", "lib", "fetchapi-ruby")
include FetchAPI


describe Download do
  before do
	Base.basic_auth('http://pixallent.myhost.dev:3000/api', 'pixallent', 'pixallent')
  end
  

it "should find by id" do
    Download.find(37).id.to_s.should == "37"
  end            


  it "should find all" do
	 d = Download.find(:all)
    d.class.should == Array
  end
end
