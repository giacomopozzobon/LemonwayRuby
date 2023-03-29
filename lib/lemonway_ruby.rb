require "active_support/core_ext/hash/indifferent_access"

require_relative "lemonway_ruby/configuration"
require_relative "lemonway_ruby/helpers"
require_relative "lemonway_ruby/client"
Dir["./lib/lemonway_ruby/accounts/**/*.rb"].each { |file| require file }
Dir["./lib/lemonway_ruby/moneyins/**/*.rb"].each { |file| require file }
Dir["./lib/lemonway_ruby/moneyouts/**/*.rb"].each { |file| require file }

module LemonwayRuby
  class << self
    include Configuration
    include Client
  end
end
