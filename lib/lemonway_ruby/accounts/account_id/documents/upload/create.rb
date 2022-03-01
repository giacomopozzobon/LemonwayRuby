module LemonwayRuby
  module Accounts
    module AccountId
      module Documents
        module Upload
          extend Helpers

          class << self
            def upload_file(account_id, hash = {})
              LemonwayRuby.authenticated do |access_token, token_type|
                required_keys = %i[buffer type name]
                params = ensure_keys(hash, required_keys)
                #   params = "{
                #    'buffer': '#{buffer}',
                #    'type': '#{type.to_i}',
                #    'name': '#{name}'
                #   }"
                #   params = params.merge(other_params) unless other_params.empty?
                #"#{url_conf}/accounts/#{accountid}/documents/upload"
                conn_client.post(generate_uri.gsub!("accountid", account_id), params.to_s, "Content-Type" => "application/json") do |req|
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