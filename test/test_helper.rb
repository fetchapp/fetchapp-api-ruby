require 'rubygems'
require 'test/unit'
require 'fakeweb'
require 'mocha'
require 'fetchapp-api-ruby'

FakeWeb.allow_net_connect = false

class Test::Unit::TestCase

  def load_fixture(name)
    File.read(File.dirname(__FILE__) + "/fixtures/#{name}.xml")
  end
end
