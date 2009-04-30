# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fetchapi-ruby}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas Reynolds, Michael Larkin"]
  s.date = %q{2009-04-30}
  s.description = %q{Integrate your site with http://fetchapp.com for seamless digital delivery.}
  s.email = %q{mikelarkin@pixallent.com}
  s.extra_rdoc_files = ["CHANGELOG", "lib/fetchapi/base.rb", "lib/fetchapi/download.rb", "lib/fetchapi/item.rb", "lib/fetchapi/order.rb", "lib/fetchapi-ruby.rb", "LICENSE", "README"]
  s.files = ["CHANGELOG", "fetchapi-ruby.gemspec", "fetchapi.gemspec", "init.rb", "lib/fetchapi/base.rb", "lib/fetchapi/download.rb", "lib/fetchapi/item.rb", "lib/fetchapi/order.rb", "lib/fetchapi-ruby.rb", "LICENSE", "Manifest", "Rakefile", "README", "spec/base_spec.rb", "spec/download_spec.rb", "spec/item_spec.rb", "spec/order_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/pixallent/fetchapi-ruby}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Fetchapi-ruby", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{fetchapi-ruby}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Integrate your site with http://fetchapp.com for seamless digital delivery.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
  end
end
