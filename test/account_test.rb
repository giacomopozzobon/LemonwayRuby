require_relative "test_helper"

describe "Account" do 
  it "register_wallet" do
    wallet_id = "test_unit_test"
    lemonway_email = "#{wallet_id}@test.com"
    address = {:street=>"5 Rue de cave", :postCode=>"22430", :city=>"Erquy", :country=>"FRA"}
    company = {:name=>"by_default", :description=>"Platforme : Finple -  finple.com/secure - Contributeur - "}
    birth = {:date=>"1959/01/01", :city=>"Erquy", :Country=>"FRA"}
    params = { company: company, 
               adresse: address, 
               accountId: wallet_id, 
               email: lemonway_email, 
               firstName: "nicolas", 
               lastName: "VANDENBOGAERDE", 
               nationality: "FRA", 
               payerOrBeneficiary: 1,  
               birth: birth,
               isDebtor: 0 }
    register_wallet = LemonwayRuby::Accounts::Legal.register_wallet(params)
    assert_equal register_wallet.body["legalAccount"]["id"], wallet_id
  end
end 