module LemonwayRuby
  module Accounts
    module Legal
      extend Helpers

      class << self
        def register_wallet(hash = {})
          LemonwayRuby.authenticated do |access_token, token_type|
            required_keys = %i[company address accountId email firstName lastName nationality payerOrBeneficiary birth isDebtor]
            params = ensure_keys(hash, required_keys)

            conn_client.post("#{generate_uri}", params.to_s, "Content-Type" => "application/json") do |req|
              req.headers['Authorization'] = "#{token_type} #{access_token}"
              req.headers['PSU-IP-Address'] = LemonwayRuby.configuration.psu_ip_address
            end
          end
        end
      end
    end
  end
end