# ************
# Documentation:
# https://documentation.lemonway.com/reference/accounts_accountsingleget
# 
# Description:
# This API call retrieves detailed information about a specific payment account
# identified by the provided @accountid (the wallet ID). The response includes
# various details of the account such as the account holder's name, email, etc.
#
# @param account_id [String] The unique identifier for the payment account.
#
# Example response (simplified):
# {
#   "account": {
#     "firstname": "John",
#     "lastname": "Doe",
#     "email": "john.doe@example.com",
#     "balance": 10000    (Balance is in cents so 10000 = €100.00)
#   }
# }
# ************



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
