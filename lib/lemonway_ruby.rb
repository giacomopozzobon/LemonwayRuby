# frozen_string_literal: true

require "active_support"
require "active_support/core_ext/hash/indifferent_access"
require_relative "lemonway_ruby/version"
#require "faraday"
#require 'ostruct'
require_relative 'lemonway_ruby/configuration.rb'
require_relative 'lemonway_ruby/base.rb'
require_relative 'lemonway_ruby/helpers.rb'
require_relative 'lemonway_ruby/client.rb'
require_relative 'lemonway_ruby/accounts/legal/legal.rb'


module LemonwayRuby
  class Error < Exception
    attr_reader :code

    def initialize(code)
      @code = code
    end
  end
  # Your code goes here...

  class << self
    #include Helper 
    include Configuration
    include Base
    include Client
    #include Accounts
  end
end
