# ************
# https://documentation.lemonway.com/reference/accounts_legalpost
# 
# Description: This API registers a new wallet for a legal entity. It requires specific 
# details of the company and the legal representative. 
# 
# @param company [Object]     The company registering the wallet.
# @param adresse [Object]     The address of the company.
# @param accountId [String]   The account ID for the wallet.
# @param email [String]       The email address of the company contact.
# @param firstName [String]   The first name of the company's primary contact.
# @param lastName [String]    The last name of the company's primary contact.
# @param nationality [String] The nationality of the company's primary contact.
# @param payerOrBeneficiary [String] Indicates whether the company is a payer or a beneficiary.
# @param birth [String]       The birthdate of the company's primary contact.
# 
# Response Example:
# The response will contain the following fields:
# - legalAccount (object):
#     - id (string): Updated Wallet ID (your choice when you create the Wallet).
#     - lemonwayId (int64): Lemonway Wallet ID (you cannot choose this number). This number is also displayed in the Dashboard.
# 
# For full details on the request parameters and the response format, please refer to the documentation.
# ************

module LemonwayRuby
  module Accounts
    module Legal
      extend Helpers

      class << self
        def register_wallet(hash = {})
          required_keys = %i[company adresse accountId email firstName lastName nationality payerOrBeneficiary birth]
          optional_keys = %i[phoneNumber, mobileNumber]
          params = ensure_keys(hash, required_keys, optional_keys)
          LemonwayRuby.post(generate_uri, params)
        end
      end
    end
  end
end
