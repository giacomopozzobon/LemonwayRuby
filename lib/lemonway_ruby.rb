# frozen_string_literal: true

require_relative "lemonway_ruby/version"
require "faraday"
require 'ostruct'
require 'lemonway_ruby/configuration.rb'
require 'lemonway_ruby/base.rb'
#require 'lemonway_ruby/client.rb'


module LemonwayRuby
  class Error < Exception
    attr_reader :code

    def initialize(code)
      @code = code
    end
  end
  # Your code goes here...

  class << self
    include Configuration
    include Base
    #include Client
  end
end
