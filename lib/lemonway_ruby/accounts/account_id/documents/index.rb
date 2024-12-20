# ************
# https://documentation.lemonway.com/reference/accounts_documentget
# 
# Description: This API allows you to get the detailed information of documents associated 
# with a wallet (identified by the :account_id). The response will provide details about the 
# documents linked to the specified wallet.
# 
# @param account_id [String] The unique identifier for the wallet (payment account).
# 
# Note: 
# - The response includes the document ID, document status, and document type for the user's account.
# - If you validate your Client's documentation using Lemonway's automated KYC, you will not receive a validityDate response.
# 
# For more information on the response format and possible parameters, refer to the full documentation.
# ************

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
