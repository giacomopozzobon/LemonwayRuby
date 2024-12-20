require_relative "test_helper"

describe "P2P" do
  it "performs a transfer successfully" do
    
    amount = 5000
    required_params = { debitAccountId: "wallet_debit_test", creditAccountId: "wallet_credit_test", amount: amount, comment: "P2P from Test Suite" }
    
    result = LemonwayRuby::P2P.transfer(required_params)

    assert_equal result["transaction"]["senderAccountId"], "wallet_debit_test"
    assert_equal result["transaction"]["receiverAccountId"], "wallet_credit_test"
    assert_equal result["transaction"]["debitAmount"], amount
    assert_equal result["transaction"]["creditAmount"], amount
  end

  it "handles missing required parameters" do
    required_params = { debitAccountId: "wallet_debit_test", creditAccountId: "wallet_credit_test" }

    assert_raises(ArgumentError) do
      LemonwayRuby::P2P.transfer(required_params)
    end
  end
end
