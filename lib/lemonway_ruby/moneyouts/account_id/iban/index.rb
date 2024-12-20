# ************
# https://documentation.lemonway.com/reference/moneyouts_ibanget
# 
# Description: This API retrieves the IBAN associated with a payment account.
# 
# @param account_id [String] The unique identifier for the payment account to fetch the associated IBAN.
# 
# For full details on the request parameters and the response format, please refer to the documentation.
# ************

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
