require_relative "test_helper"

describe "Moneyins" do
  it "createIban" do
    params = {wallet: "test_unit_test", country: "FR"}
    bic_ban = LemonwayRuby::Moneyins::Bankwire::Iban::Create.createIban(params)
    assert_equal bic_ban["status"], 0
  end
end
