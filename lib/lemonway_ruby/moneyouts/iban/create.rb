module LemonwayRuby
  module Moneyouts
    module Iban
      extend Helpers
      # https://documentation.lemonway.com/reference/moneyouts_ibanpost
      class << self
        def registerIBAN(hash = {}, other_attr = {})
          LemonwayRuby.authenticated do |access_token, token_type|
            required_keys = %i[accountId holder iban]
            params = ensure_keys(hash, required_keys)
            params = params.merge(other_attr)
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