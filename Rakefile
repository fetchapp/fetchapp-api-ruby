require 'rubygems'
require 'rake'
require 'echoe'
require 'spec/rake/spectask'

Echoe.new('fetchapi-ruby', '0.2.1') do |p|
  p.description    = "Integrate your site with http://fetchapp.com for seamless digital delivery."
  p.url            = "http://github.com/pixallent/fetchapi-ruby"
  p.author         = ["Thomas Reynolds, Michael Larkin"]
  p.email          = "mikelarkin@pixallent.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
  p.runtime_dependencies = ["httparty"]
end

task :default => :spec
desc "Run all specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts = %w(--format specdoc --colour)
  t.spec_files = Dir['spec/**/*_spec.rb'].sort
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }