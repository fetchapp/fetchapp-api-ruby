require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('fetchapi-ruby', '0.9.2') do |p|
  p.description    = "Integrate your site with http://fetchapp.com for seamless digital delivery."
  p.url            = "http://github.com/pixallent/fetchapi-ruby"
  p.author         = ["Thomas Reynolds, Michael Larkin"]
  p.email          = "mikelarkin@pixallent.com"
  p.ignore_pattern = ["tmp/*", "script/*", "spec/*"]
  p.development_dependencies = []
  p.runtime_dependencies = ["httparty"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }