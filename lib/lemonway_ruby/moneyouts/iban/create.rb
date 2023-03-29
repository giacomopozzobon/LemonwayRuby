module LemonwayRuby
  module Moneyouts
    module Iban
      extend Helpers
      # https://documentation.lemonway.com/reference/moneyouts_ibanpost
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
