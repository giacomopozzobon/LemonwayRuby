module LemonwayRuby
  module Accounts
    module AccountId
      module Transactions
        extend Helpers

        class << self
          def get_wallet_trans_history(accountId)
            LemonwayRuby.get(generate_uri.gsub("accountid", accountId.to_s))
          end
        end
      end
    end
  end
end
