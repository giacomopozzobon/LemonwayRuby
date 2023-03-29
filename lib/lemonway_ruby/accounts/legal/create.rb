module LemonwayRuby
  module Accounts
    module Legal
      extend Helpers

      class << self
        def register_wallet(hash = {})
          required_keys = %i[company adresse accountId email firstName lastName nationality payerOrBeneficiary birth isDebtor]
          params = ensure_keys(hash, required_keys)
          LemonwayRuby.post(generate_uri, params)
        end
      end
    end
  end
end
