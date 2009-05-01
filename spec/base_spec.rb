require File.join(File.dirname(__FILE__), "..", "lib", "fetchapi-ruby")
include FetchAPI

describe Base do

  before do
	Base.basic_auth('http://pixallent.myhost.dev:3000/api', 'pixallent', 'pixallent')
  end

  it "should catch invalid login" do
    Base.basic_auth('http://pixallent.myhost.dev:3000/api', 'bad', 'login')
    lambda {Account.details}.should raise_error("Unauthorized")
  end
end