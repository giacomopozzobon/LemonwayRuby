module LemonwayRuby
  module Moneyouts
    module AccountId
      module Iban
        extend Helpers

        class << self
          def get_wallet_details_iban(account_id)
            LemonwayRuby.get(generate_uri.gsub("accountid", account_id.to_s))
          end
        end
      end
    end
  end
end
