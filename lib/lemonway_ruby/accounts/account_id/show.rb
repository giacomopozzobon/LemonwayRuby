module LemonwayRuby
  module Accounts
    module AccountId
      extend Helpers

      class << self
        def get_wallet_details_account(account_id)
          LemonwayRuby.get(generate_uri.gsub("accountid", account_id.to_s))
        end
      end
    end
  end
end
