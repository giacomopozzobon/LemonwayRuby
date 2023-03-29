module LemonwayRuby
  module Moneyins
    module AccountId
      module Mandate
        module MandateId
          module Document
            extend Helpers

            class << self
              def show(accountid, mandateid)
                LemonwayRuby.get(generate_uri.gsub("mandateid", mandateid.to_s).gsub("accountid", accountid.to_s))
              end
            end
          end
        end
      end
    end
  end
end
