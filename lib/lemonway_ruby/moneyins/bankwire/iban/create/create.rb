module LemonwayRuby
  module Moneyins
    module Bankwire
      module Iban
        module Create
          extend Helpers 

          class << self
            def createIban(hash = {})
              required_keys = %i[wallet country]
              params = ensure_keys(hash, required_keys)
              LemonwayRuby.authenticated do |access_token, token_type|
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
end
