module LemonwayRuby
  module Moneyins
    module Sdd
      module Init
        extend Helpers

        class << self
          def money_in_sdd_init(hash = {})
            LemonwayRuby.authenticated do |access_token, token_type|
              required_keys = %i[sddMandateId accountId autoCommission totalAmount]
              params = ensure_keys(hash, required_keys)
              puts generate_uri
              conn_client.post(generate_uri, params.to_json, "Content-Type" => "application/json") do |req|
                req.headers['Authorization'] = "#{token_type} #{access_token}"
                req.headers['PSU-IP-Address'] = LemonwayRuby.configuration.psu_ip_address
              end
            end
          end
        end
      end
    end
  end
end