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
require_relative 'lemonway_ruby/accounts/legal/create.rb'
require_relative 'lemonway_ruby/accounts/account_id/documents/upload/create.rb'
require_relative 'lemonway_ruby/moneyouts/iban/create.rb'
require_relative 'lemonway_ruby/moneyins/sdd/mandate/create.rb'
require_relative 'lemonway_ruby/accounts/account_id/documents/document_id/signinit/create.rb'
require_relative 'lemonway_ruby/moneyins/sdd/mandate/mandate_id/unregister/delete.rb'
require_relative 'lemonway_ruby/accounts/kycstatus/account_id/update.rb'
require_relative 'lemonway_ruby/moneyouts/account_id/iban/index.rb'
require_relative 'lemonway_ruby/accounts/account_id/show.rb'
require_relative 'lemonway_ruby/accounts/account_id/documents/index.rb'
require_relative 'lemonway_ruby/accounts/account_id/transactions/index.rb'
require_relative 'lemonway_ruby/moneyins/bankwire/iban/create/create.rb'
require_relative 'lemonway_ruby/moneyins/sdd/mandate/init/create.rb'
require_relative 'lemonway_ruby/moneyins/account_id/mandate/mandate_id/document/show.rb'

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
