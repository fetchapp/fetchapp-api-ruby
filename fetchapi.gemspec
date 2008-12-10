# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fetchapi}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas Reynolds"]
  s.date = %q{2008-12-09}
  s.email = %q{tdreyno@gmail.com}
  s.files = ["README", "lib/fetchapi.rb", "lib/fetchapi/item.rb", "lib/fetchapi/order.rb"]
  s.homepage = %q{http://github.com/tdreyno/fetchapi}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby interface to fetchapp.com}

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
