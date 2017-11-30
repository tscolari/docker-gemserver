require "bundler/setup"
require "rubygems"
require "geminabox"

Geminabox.data = "/var/gems"
unless ENV['USERNAME'].nil? && ENV['PASSWORD'].nil?
  use Rack::Auth::Basic do |username, password|
    username == ENV['USERNAME'] && password == ENV['PASSWORD']
  end
end

run Geminabox::Server
