require File.join(File.dirname(__FILE__), "..", "lib", "fetchapi")
include FetchAPI

describe Base do
  xit "should catch invalid login" do
    Base.basic_auth('bad', 'login')
    Item.find(:all).should throw("Incorrect login credentials")
  end
end