module LemonwayRuby
  module Accounts
    module AccountId
      module Documents
        extend Helpers

        class << self
          def get_wallet_details_doc(account_id)
            LemonwayRuby.get(generate_uri.gsub("accountid", account_id.to_s))
          end
        end
      end
    end
  end
end
