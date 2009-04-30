# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fetchapi-ruby}
  s.version = "0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas Reynolds", "Michael Larkin"]
  s.date = %q{2009-04-30}
  s.email = %q{mikelarkin@pixllent.com}
  s.files = ["README", "lib/fetchapi.rb", "lib/fetchapi/base.rb", "lib/fetchapi/item.rb", "lib/fetchapi/order.rb", "lib/fetchapi/download.rb", "spec/base_spec.rb", "spec/item_spec.rb", "spec/order_spec.rb", "spec/download_spec.rb"]
  s.homepage = %q{http://github.com/piallent/fetchapi-ruby}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby interface to fetchapp.com}
  s.test_files = ["spec/base_spec.rb", "spec/item_spec.rb", "spec/order_spec.rb", "spec/download_spec.rb"]

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
