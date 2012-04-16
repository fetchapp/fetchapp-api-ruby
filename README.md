# Installation from RubyGems.org
	gem install fetchapp-api-ruby


# Setup
```ruby
	FetchAPI::Base.basic_auth('youraccount.fetchapp.com', 'demokey', 'demotoken')
```
# Account
```ruby
	account = FetchAPI::Account.details

	token = FetchAPI::Account.new_token  # Subsequent calls will use the new token automatically
```
# Downloads
```ruby
	downloads = FetchAPI::Download.find(:all, :per_page => 50, :page => 2)

	download = FetchAPI::Download.find(1)
```

# Items
```ruby
	items = FetchAPI::Item.find(:all, :per_page => 10, :page => 3)

	item = FetchAPI::Item.find("CJ0001")

	item = FetchAPI::Item.create(:sku => "CJ0001", :name => "Carrot Juice")

	item.update(:name => "Tomato Juice")

	item.destroy

	downloads = item.downloads  # Returns an array of FetchAPI::Downloads for this item
```
# Orders
```ruby
	all_orders = FetchAPI::Order.find(:all)

	current_orders = FetchAPI::Order.find(:current, :page => 3)

	manual_orders = FetchAPI::Order.find(:manual, :per_page => 10)

	expired_orders = FetchAPI::Order.find(:expired, :per_page => 10, :page => 3)

	order = FetchAPI::Order.find("1001")

	order = FetchAPI::Order.create(
	    :id => "1015",
	    :title => "Test Order",
	    :first_name => "Donald",
	    :last_name => "Duck",
	    :email => "donald@duck.com",
	    :order_items => [{:sku => 'ABC0001'}, {:sku => 'ABC0002'}]
	)

	order.update(:first_name => "Daffy")

	order.destroy

	downloads = order.downloads  # Returns an array of FetchAPI::Downloads for this order
```