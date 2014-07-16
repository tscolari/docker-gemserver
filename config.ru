require "bundler/setup"
require "rubygems"
require "geminabox"

Geminabox.data = "/var/gems"
use Rack::Auth::Basic do |username, password|
  username == ENV['USERNAME'] && password == ENV['PASSWORD']
end

run Geminabox::Server
