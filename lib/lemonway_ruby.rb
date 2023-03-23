# frozen_string_literal: true

require "active_support"
require "active_support/core_ext/hash/indifferent_access"

require "lemonway_ruby/configuration"
require "lemonway_ruby/base"
require "lemonway_ruby/helpers"
require "lemonway_ruby/client"
require "lemonway_ruby/accounts/account_id/documents/document_id/signinit/create"
require "lemonway_ruby/accounts/account_id/documents/index"
require "lemonway_ruby/accounts/account_id/documents/upload/create"
require "lemonway_ruby/accounts/account_id/show"
require "lemonway_ruby/accounts/account_id/transactions/index"
require "lemonway_ruby/accounts/kycstatus/account_id/update"
require "lemonway_ruby/accounts/legal/create"
require "lemonway_ruby/moneyins/account_id/mandate/mandate_id/document/show"
require "lemonway_ruby/moneyins/bankwire/iban/create/create"
require "lemonway_ruby/moneyins/sdd/mandate/create"
require "lemonway_ruby/moneyins/sdd/mandate/init/create"
require "lemonway_ruby/moneyins/sdd/mandate/mandate_id/unregister/delete"
require "lemonway_ruby/moneyouts/account_id/iban/index"
require "lemonway_ruby/moneyouts/iban/create"

module LemonwayRuby
  class Error < Exception
    attr_reader :code

    def initialize(code)
      @code = code
    end
  end

  class << self
    include Configuration
    include Base
    include Client
  end
end
