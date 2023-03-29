require "minitest/autorun"
require "minitest/spec"
require "minitest/reporters"
require "ostruct"
require_relative "../lib/lemonway_ruby"

LemonwayRuby.configure do |c|
  c.url_auth = "XXX"
  c.url_api = "XXX"
  c.psu_ip_address = "127.0.0.1"
  c.authorization = "basic XXX"
  c.proxy_url = nil
end

Minitest::Reporters.use!
