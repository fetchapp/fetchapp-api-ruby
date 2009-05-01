require File.join(File.dirname(__FILE__), "..", "lib", "fetchapi-ruby")
include FetchAPI

describe Account do
  before do
    Base.basic_auth('http://pixallent.myhost.dev:3000/api', 'pixallent', 'pixallent')
  end

end
