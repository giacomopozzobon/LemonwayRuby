module LemonwayRuby
  module Accounts
    module Legal
      extend Helpers

      class << self
        def register_wallet(required_keys = [], optional_keys = [])
          authenticated do |access_token, token_type|
            args = %i[company address accountId email firstName lastName nationality payerOrBeneficiary birth isDebtor]
            params = format_hash(args, required_keys, optional_keys)
            conn_lemonway(request_content_type: :url_encoded).post("#{LemonwayRuby.url_conf}/#{generate_uri}", params, "Content-Type" => "application/json") do |req|
              req.headers['Authorization'] = "#{token_type} #{access_token}"
              req.headers['PSU-IP-Address'] = LemonwayRuby.configuration.psu_ip_address
            end
          end
        end
      end
    end
  end
end