# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fetchapp-api-ruby}
  s.version = "2.0.0"
  s.platform = Gem::Platform::RUBY
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Larkin"]
  s.date = Date.today.strftime('%Y-%m-%d')
  s.description = %q{Integrate your site with http://fetchapp.com for seamless digital delivery.}
  s.email = %q{support@fetchapp.com}
  s.extra_rdoc_files = ["CHANGELOG", "lib/fetchapp-api-ruby/account.rb", "lib/fetchapp-api-ruby/base.rb", "lib/fetchapp-api-ruby/download.rb", "lib/fetchapp-api-ruby/upload.rb", "lib/fetchapp-api-ruby/product.rb", "lib/fetchapp-api-ruby/order.rb", "lib/fetchapp-api-ruby.rb", "LICENSE", "README.md"]
  s.files = ["CHANGELOG", "fetchapp-api-ruby.gemspec", "init.rb", "lib/fetchapp-api-ruby/account.rb", "lib/fetchapp-api-ruby/base.rb", "lib/fetchapp-api-ruby/download.rb", "lib/fetchapp-api-ruby/upload.rb", "lib/fetchapp-api-ruby/product.rb", "lib/fetchapp-api-ruby/order.rb", "lib/fetchapp-api-ruby.rb", "LICENSE", "Manifest", "Rakefile", "README.md"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/getsy/fetchapp-api-ruby}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "fetchapp-api-ruby", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{This Ruby library allows you to integrate your site with http://fetchapp.com for seamless digital delivery so you can build additional functionality while retaining the core features of Fetch.  Credit for the bulk of the code goes to Thomas Reynolds.}

  s.add_runtime_dependency("httparty")
  s.add_development_dependency("fakeweb")
  s.add_development_dependency("mocha")

end
