module LemonwayRuby
  module Moneyins
    extend Helpers

    class << self
      def retrieve_payment_details(hash = {})
        optional_keys = %i[transactionId transactionComment transactionMerchantToken startDate endDate page limit]
        params = ensure_keys(hash, [], optional_keys)
        LemonwayRuby.get(generate_uri, params)
      end
    end
  end
end
