module LemonwayRuby
  module Moneyins
    module Sdd
      module Mandate
        extend Helpers

        class << self
          def register_sdd_mandate(hash = {}, other_attr = {})
            LemonwayRuby.authenticated do |access_token, token_type|
              required_keys = %i[wallet holder bic iban isRecurring]
              params = ensure_keys(hash, required_keys)
              params = params.merge(other_attrs)
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