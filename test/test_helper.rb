require "dotenv/load"
require "minitest/autorun"
require "minitest/spec"
require "minitest/reporters"
require "ostruct"
require_relative "../lib/lemonway_ruby"

LemonwayRuby.configure do |c|
  c.url_auth = ENV["LEMONWAY_URL_AUTH"]
  c.url_api = ENV["LEMONWAY_URL_API"]
  c.psu_ip_address = ENV["LEMONWAY_PSU_IP"] || "127.0.0.1"
  c.authorization = ENV["LEMONWAY_API_KEY"]
  c.proxy_url = ENV["LEMONWAY_PROXY_URL"]
end

Minitest::Reporters.use!
