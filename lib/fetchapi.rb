require 'rubygems'
require 'httparty'

$:.unshift(File.dirname(__FILE__))
require 'fetchapi/item'
require 'fetchapi/order'

module FetchAPI
  def self.setup(key, token)
    FetchAPI::Item.send(:basic_auth, key, token)
    FetchAPI::Order.send(:basic_auth, key, token)
  end
end