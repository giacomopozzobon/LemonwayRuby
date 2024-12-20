# ************
# https://documentation.lemonway.com/reference/p2ps_p2ppost
# 
# Performs a P2P transfer between two payment accounts.
#
# Description:
# This API allows you to transfer funds between two payment accounts within Lemonway.
# The funds are debited from the source account and credited to the destination account.
#
# @param hash [Hash] The search parameters.
#     - :debit_account_id [String] The ID of the account to be debited (required).
#     - :credit_account_id [String] The ID of the account to be credited (required).
#     - :amount [Integer] The amount to transfer in cents (required).
#     - :comment [String] A comment for the payment (optional, max 140 chars).
#     - :scheduled_date [String] The scheduled date for the payment in YYYY-MM-DD format (optional).
#     - :private_data [Hash] Private data associated with the payment (optional).
#     - :origin_transaction_id (integer). The origin transaction ID. If not provided, it will be auto-generated. (required)
#     - :reference [String] A unique reference ID for the transaction (optional, max 36 chars).
#
# Example usage:
# LemonwayRuby::P2P.transfer({
#   debitAccountId: "wallet_debit_test",
#   creditAccountId: "wallet_credit_test",
#   amount: 5000,                         (Amount is in cents so 5000 = €50.00)
#   comment: "Payment for services",
#   scheduledDate: "2024-12-20",
#   privateData: {...},
#   originTransactionId: 987654,
#   reference: "P2P-2024-01"
# })
# ************

require 'securerandom'

module LemonwayRuby
  module P2P
    extend Helpers

    class << self
      def transfer(hash = {})
        required_keys = %i[debitAccountId creditAccountId amount originTransactionId]
        optional_keys = %i[comment scheduledDate privateData reference]
        params = ensure_keys(hash, required_keys, optional_keys)

        params[:originTransactionId] ||= SecureRandom.uuid    # auto-generate originTransactionId

        LemonwayRuby.post(generate_uri, params)
      end
    end
  end
end
