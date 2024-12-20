# ************
# https://documentation.lemonway.com/reference/moneyouts_ibanpost
# 
# Description: This API registers a new IBAN to send Money-Out from the Lemonway payment account 
# to the bank account of your Clients. This method lets our system link an IBAN to a payment account.
# 
# Bank account details are only needed for Money-Outs, not for Money-Ins or P2P.
#
# When you link a new bank account (IBAN format or other ones), the previous details are still active.
# To deactivate a bank account from a payment account, use the IbanUnregisterPut call.
# If you wish to use only one bank account per payment account, please contact support.
# An integrated algorithm will validate your IBAN.
# 
# @param accountId [String]   The wallet account ID to associate with the IBAN.
# @param holder [String]      Registered Bank Account Owner: First and Last name, or Company Name
# @param iban [String]        The IBAN (International Bank Account Number) to register.
# You can also pass additional attributes via the optional `other_attr` parameter. (optional)
# 
# For full details on the request parameters and the response format, please refer to the documentation.
# ************

module LemonwayRuby
  module Moneyouts
    module Iban
      extend Helpers

      class << self
        def registerIBAN(hash = {}, other_attr = {})
          required_keys = %i[accountId holder iban]
          params = ensure_keys(hash, required_keys)
          params = params.merge(other_attr)
          LemonwayRuby.post(generate_uri, params)
        end
      end
    end
  end
end
