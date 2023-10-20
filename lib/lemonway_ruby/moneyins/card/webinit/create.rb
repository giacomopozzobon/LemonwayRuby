module LemonwayRuby
  module Moneyins
    module Card
      module Webinit
        extend Helpers

        class << self
          def create(hash = {})
            required_keys = %i[accountId returnUrl errorUrl cancelUrl]
            optional_keys = %i[registerCard captureDelayedDays label cardId threeDS riskAnalysis recurringAvgAmount paymentPattern reference totalAmount commissionAmount comment autoCommission]
            params = ensure_keys(hash, required_keys, optional_keys)
            LemonwayRuby.post(generate_uri, params)
          end
        end
      end
    end
  end
end
