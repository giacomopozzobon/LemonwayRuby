# ************
# https://documentation.lemonway.com/reference/accounts_kycstatusget
# 
# Description: This API retrieves users, documents, or IBANs whose status has changed 
# since a specified update date. It can return the same user multiple times in the 
# same request if their status has changed multiple times since the specified date.
#
# @param updateDate [String] The date from which to check the modifications (UTC Unix timestamp).
# 
# The method expects a hash with the required key :updateDate to specify the entry date.
# For details on the status IDs in the response, please refer to the documentation.
# ************

module LemonwayRuby
  module Accounts
    module Kycstatus
      extend Helpers

      class << self
        def get_kyc_status(hash)
          required_keys = %i[updateDate]
          params = ensure_keys(hash, required_keys)
          LemonwayRuby.get(generate_uri, params)
        end
      end
    end
  end
end
