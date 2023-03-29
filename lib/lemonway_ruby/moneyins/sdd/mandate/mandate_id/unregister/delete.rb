module LemonwayRuby
  module Moneyins
    module Sdd
      module Mandate
        module MandateId
          module Unregister
            extend Helpers

            class << self
              def unregister_sdd_mandate(mandateid, hash)
                required_keys = %i[account]
                params = ensure_keys(hash, required_keys)
                LemonwayRuby.put(generate_uri.gsub("mandateid", mandateid.to_s), params)
              end
            end
          end
        end
      end
    end
  end
end
