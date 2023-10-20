require "active_support/core_ext/hash/indifferent_access"
require_relative "lemonway_ruby/configuration"
require_relative "lemonway_ruby/helpers"
require_relative "lemonway_ruby/client"

require_relative "lemonway_ruby/accounts/account_id/documents/document_id/signinit/create"
require_relative "lemonway_ruby/accounts/account_id/documents/index"
require_relative "lemonway_ruby/accounts/account_id/documents/upload/create"
require_relative "lemonway_ruby/accounts/account_id/show"
require_relative "lemonway_ruby/accounts/account_id/transactions/index"
require_relative "lemonway_ruby/accounts/individual/create"
require_relative "lemonway_ruby/accounts/kycstatus/account_id/update"
require_relative "lemonway_ruby/accounts/legal/create"
require_relative "lemonway_ruby/moneyins/account_id/mandate/mandate_id/document/show"
require_relative "lemonway_ruby/moneyins/bankwire/iban/create/create"
require_relative "lemonway_ruby/moneyins/card/webinit/create"
require_relative "lemonway_ruby/moneyins/index"
require_relative "lemonway_ruby/moneyins/sdd/mandate/create"
require_relative "lemonway_ruby/moneyins/sdd/mandate/init/create"
require_relative "lemonway_ruby/moneyins/sdd/mandate/mandate_id/unregister/delete"
require_relative "lemonway_ruby/moneyouts/account_id/iban/index"
require_relative "lemonway_ruby/moneyouts/iban/create"

module LemonwayRuby
  class << self
    include Configuration
    include Client
  end
end
