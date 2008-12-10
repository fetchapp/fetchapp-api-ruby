require 'rubygems' 
require 'rake/gempackagetask'
require 'rubygems/specification'
require 'spec/rake/spectask'

NAME = "fetchapi"
GEM_VERSION = "0.1"

spec = Gem::Specification.new do |s|
  s.name     = NAME
  s.version  = GEM_VERSION
  s.date     = "2008-12-09"
  s.authors  = ["Thomas Reynolds"]
  s.email    = "tdreyno@gmail.com"
  s.homepage = "http://github.com/tdreyno/#{NAME}"
  s.summary  = "Ruby interface to fetchapp.com"
  s.files      = ["lib/fetchapi.rb",
                  "lib/fetchapi/item.rb",
                  "lib/fetchapi/order.rb"]
  s.add_dependency("httparty")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end
 
desc "Install the plugin locally"
task :install => [:package] do
  sh %{sudo gem install pkg/#{NAME}-#{GEM_VERSION} --no-update-sources}
end

desc "Create a gemspec file"
task :make_spec do
  File.open("#{NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

task :default => :spec
desc "Run all specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts = %w(--format specdoc --colour)
  t.spec_files = Dir['spec/**/*_spec.rb'].sort
end