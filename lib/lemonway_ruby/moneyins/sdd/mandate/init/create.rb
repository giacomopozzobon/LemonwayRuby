module LemonwayRuby
  module Moneyins
    module Sdd
      module Init
        extend Helpers

        class << self
          def money_in_sdd_init(hash = {})
            required_keys = %i[sddMandateId accountId autoCommission totalAmount]
            params = ensure_keys(hash, required_keys)
            LemonwayRuby.post(generate_uri, params)
          end
        end
      end
    end
  end
end
