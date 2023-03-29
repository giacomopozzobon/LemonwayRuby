module LemonwayRuby
  module Accounts
    module Kycstatus
      module AccountId
        extend Helpers

        class << self
          def update_wallet_status(accountid, hash)
            required_keys = %i[status]
            params = ensure_keys(hash, required_keys)
            LemonwayRuby.put(generate_uri.gsub("accountid", accountid.to_s), params)
          end
        end
      end
    end
  end
end
