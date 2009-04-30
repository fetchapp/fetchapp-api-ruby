require File.join(File.dirname(__FILE__), "..", "lib", "fetchapi")
include FetchAPI

describe Download do
  xit "should find by id" do
    Download.find(1).id.should == 1
  end
  it "should find all" do
    Download.find(:all).length.should > 0
  end
end
