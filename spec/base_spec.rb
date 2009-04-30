require File.join(File.dirname(__FILE__), "..", "lib", "fetchapi")
include FetchAPI

describe Base do
  xit "should catch invalid login" do
    Base.basic_auth('http://demo.fetchapp.com/api', 'bad', 'login')
    Item.find(:all).should throw("Incorrect login credentials")
  end
end