module LemonwayRuby
  module Accounts
    module Kycstatus
      module AccountId
        extend Helpers

        class << self
          def update_wallet_status(accountid, hash)
            LemonwayRuby.authenticated do |access_token, token_type|
              required_keys = %i[status]
              params = ensure_keys(hash, required_keys)
              conn_client.put(generate_uri.gsub("accountid", accountid.to_s), params.to_json, "Content-Type" => "application/json") do |req|
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