module LemonwayRuby
  module Moneyins
    module Bankwire
      module Iban
        module Create
          extend Helpers

          class << self
            def createIban(hash = {})
              required_keys = %i[wallet country]
              params = ensure_keys(hash, required_keys)
              LemonwayRuby.post(generate_uri, params)
            end
          end
        end
      end
    end
  end
end
