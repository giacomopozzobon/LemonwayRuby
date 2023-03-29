require_relative "test_helper"

describe "Moneyouts" do
  it "registerIBAN" do
    required_attr = {accountId: "test_unit_test", holder: "Nicolas VANDENBOGAERDE", iban: "FR1420041010050500013M02606"}
    other_attr = {domiciliation1: "Toto", domiciliation2: "5  Rue de cave 22430 Erquy France"}
    output = LemonwayRuby::Moneyouts::Iban.registerIBAN(required_attr, other_attr)
    assert_equal output["status"], 5
  end

  it "get_wallet_details_iban" do
    ibans = LemonwayRuby::Moneyouts::AccountId::Iban.get_wallet_details_iban("test_unit_test")
    assert_equal ibans["ibans"][0]["status"], 4
  end
end
