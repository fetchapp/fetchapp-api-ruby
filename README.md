# Installation from RubyGems.org
	gem install fetchapp-api-ruby


# Setup
```ruby
	FetchAppAPI::Base.basic_auth(:key => 'demokey', :token => 'demotoken')
```
# Account
```ruby
	account = FetchAppAPI::Account.details

	token = FetchAppAPI::Account.new_token  # Subsequent calls will use the new token automatically
```
# Downloads
```ruby
	downloads = FetchAppAPI::Download.find(:all, :per_page => 50, :page => 2)

	download = FetchAppAPI::Download.find(1)
```

# Products
```ruby
	products = FetchAppAPI::Product.find(:all, :per_page => 10, :page => 3)

	product = FetchAppAPI::Product.find("CJ0001")

	product = FetchAppAPI::Product.create(:sku => "CJ0001", :name => "Carrot Juice")

	product.update(:name => "Tomato Juice")

	product.destroy

	product.stats  # Returns a FetchAppAPI::Product with only statistical fields filled in

	downloads = product.downloads  # Returns an array of FetchAppAPI::Download for this product

	files = product.files  # Returns an array of FetchAppAPI::File for this product
```
# Orders
```ruby
	all_orders = FetchAppAPI::Order.find(:all)

	current_orders = FetchAppAPI::Order.find(:current, :page => 3)

	manual_orders = FetchAppAPI::Order.find(:manual, :per_page => 10)

	expired_orders = FetchAppAPI::Order.find(:expired, :per_page => 10, :page => 3)

	order = FetchAppAPI::Order.find("1001")

	order = FetchAppAPI::Order.create(
	    :id => "1015",
	    :title => "Test Order",
	    :first_name => "Donald",
	    :last_name => "Duck",
	    :email => "donald@duck.com",
	    :order_items => [{:sku => 'ABC0001'}, {:sku => 'ABC0002'}]
	)

	order.update(:first_name => "Daffy")

	order.destroy

	order.expire # Expires the order

	order.send_email # Reopens the order and sends out an email to the customer

	order.stats  # Returns a FetchAppAPI::Order with only statistical fields filled in

	order_items = order.order_items # Returns an array of FetchAppAPI::OrderItem for this order

	downloads = order.downloads  # Returns an array of FetchAppAPI::Download for this order

```

# OrderItems
```ruby
	order_items = order.order_items # Returns an array of FetchAppAPI::OrderItem for this order

	order_item = FetchAppAPI::Order.find("445566")

    order_item.expire # Expires the OrderItem

	downloads = order_item.downloads  # Returns an array of FetchAppAPI::Download for this order item

	files = order_item.files  # Returns an array of FetchAppAPI::File for this order item
```