module LemonwayRuby
  module Accounts
    module AccountId
      module Transactions
        extend Helpers

        class << self
          def get_wallet_trans_history(accountId)
            LemonwayRuby.authenticated do |access_token, token_type|
              conn_client.get(generate_uri.gsub("accountid", accountId.to_s)) do |req|
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