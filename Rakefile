require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('fetchapp-api-ruby', '1.2.0') do |p|
  p.description    = "Integrate your site with http://fetchapp.com for seamless digital delivery."
  p.url            = "http://github.com/getsy/fetchapp-api-ruby"
  p.author         = ["Thomas Reynolds, Michael Larkin"]
  p.email          = "mikelarkin@fetchapp.com.com"
  p.ignore_pattern = ["tmp/*", "script/*", "spec/*"]
  p.development_dependencies = []
  p.runtime_dependencies = ["httparty"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }