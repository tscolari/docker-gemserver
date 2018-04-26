require "bundler/setup"
require "rubygems"
require "geminabox"
require "rack-health"

Geminabox.data = "/var/gems"

use Rack::Health

unless ENV['USERNAME'].nil? && ENV['PASSWORD'].nil?
  use Rack::Auth::Basic do |username, password|
    username == ENV['USERNAME'] && password == ENV['PASSWORD']
  end
end

run Geminabox::Server
