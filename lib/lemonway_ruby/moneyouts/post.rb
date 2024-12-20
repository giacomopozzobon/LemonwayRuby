# ************
# https://documentation.lemonway.com/reference/moneyouts_moneyoutpost
# 
# Description: This API allows transferring funds from a Lemonway payment account to a private bank account. 
# The system performs the transfer to the IBAN if all conditions are met, or returns an error otherwise.
# 
# @param hash [Hash] The search parameters.
#     - :accountId [String] The ID of the payment account to be debited.
#     - :ibanId [Integer] (Optional) The ID of the IBAN to credit. If not provided, the last validated IBAN will be used.
#     - :totalAmount [Integer] The total amount to debit from the wallet (in cents). The recipient will receive the total minus the commission amount.
#     - :commissionAmount [Integer] (Optional) Your fee (in cents). Ignored if `autoCommission` is set to true.
#     - :comment [String] (Optional) A comment for the transfer. It will appear on the recipient's bank statement (max 140 characters).
#     - :autoCommission [Boolean] Whether to use Lemonway's fee structure. If true, your commission will be ignored.
#     - :reference [String] (Optional) A unique reference ID for the transaction (max 50 characters). This can be used for later search queries.
# 
# Notes:
# - The payment account is debited immediately. Funds typically arrive in the recipient's account within 1 to 3 days, depending on interbanking systems.
# - The transfer message format is: "XXXX-YYYY ZZZZ", where:
#   - XXXX is your environment name.
#   - YYYY is the Money-Out operation ID.
#   - ZZZZ is your comment (alphanumeric, max 35 characters).
# - Ensure the total amount does not exceed the wallet balance.
# - Use the `ibanId` to specify a particular IBAN; otherwise, the default IBAN will be used.
# - For more details, see the documentation linked above.
# ************

module LemonwayRuby
  module Moneyouts
    extend Helpers

    class << self
      def perform_moneyout(hash = {})
        required_keys = %i[accountId totalAmount autoCommission]
        optional_keys = %i[ibanId commissionAmount comment reference]
        params = ensure_keys(hash, required_keys, optional_keys)

        LemonwayRuby.post(generate_uri, params)
      end
    end
  end
end
