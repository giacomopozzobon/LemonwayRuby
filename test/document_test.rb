require_relative "test_helper"

describe "Documents" do 
  it "get_wallet_details_doc" do
    docs = LemonwayRuby::Accounts::AccountId::Documents.get_wallet_details_doc("test_unit_test").body
    assert_equal docs.has_key?("documents"), true
  end
end