require "minitest/autorun"
require "minitest/spec"
require "minitest/reporters"
require "ostruct"
require_relative "../lib/lemonway_ruby"

LemonwayRuby.configure do |config|
  config.url_auth = "XXXX" 
  config.url = "XXXX"
  config.authorization = "XXX"
  config.grant_type = "XXXX"
  config.client = "XXXX"
  config.return_url = "XXXX"
  config.api_version = "XXX"
  config.psu_ip_address = "127.0.0.1"
  config.webservice = "directkitrest"
end

Minitest::Reporters.use!