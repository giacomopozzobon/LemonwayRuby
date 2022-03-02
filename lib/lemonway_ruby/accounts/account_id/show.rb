module LemonwayRuby
  module Accounts
    module AccountId
      extend Helpers

      class << self
        def get_wallet_details_account(account_id)
          LemonwayRuby.authenticated do |access_token, token_type|
            conn_client.get(generate_uri.gsub("accountid", account_id.to_s)) do |req|
              req.headers['Authorization'] = "#{token_type} #{access_token}"
              req.headers['PSU-IP-Address'] = LemonwayRuby.configuration.psu_ip_address
            end
          end
        end
      end
    end
  end
end