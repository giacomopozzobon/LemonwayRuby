module LemonwayRuby
  module Accounts
    module Individual
      extend Helpers

      class << self
        def register_wallet(hash = {})
          required_keys = %i[accountId email firstName lastName adresse birth nationality payerOrBeneficiary isDebtor]
          optional_keys = %i[title phoneNumber mobileNumber]
          params = ensure_keys(hash, required_keys, optional_keys)
          LemonwayRuby.post(generate_uri, params)
        end
      end
    end
  end
end
