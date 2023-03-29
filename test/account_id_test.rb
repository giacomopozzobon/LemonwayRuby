require_relative "test_helper"

describe "AccountId" do
  it "get_wallet_details_doc" do
    account = LemonwayRuby::Accounts::AccountId.get_wallet_details_account("test_unit_test")
    assert_equal account["account"]["firstname"], "Nicolas"
    assert_equal account["account"]["lastname"], "VANDENBOGAERDE"
  end
end
