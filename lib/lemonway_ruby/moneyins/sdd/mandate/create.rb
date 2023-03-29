module LemonwayRuby
  module Moneyins
    module Sdd
      module Mandate
        extend Helpers

        class << self
          def register_sdd_mandate(hash = {}, other_attrs = {})
            required_keys = %i[wallet holder bic iban isRecurring]
            params = ensure_keys(hash, required_keys)
            params = params.merge(other_attrs)
            LemonwayRuby.post(generate_uri, params)
          end
        end
      end
    end
  end
end
