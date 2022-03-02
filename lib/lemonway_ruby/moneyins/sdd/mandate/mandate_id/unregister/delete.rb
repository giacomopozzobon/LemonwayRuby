module LemonwayRuby
  module Moneyins
    module Sdd
      module Mandate
        module MandateId
          module Unregister
            extend Helpers

            class << self
              def unregister_sdd_mandate(mandateid, hash)
                LemonwayRuby.authenticated do |access_token, token_type|
                  required_keys = %i[account]
                  params = ensure_keys(hash, required_keys)
                  conn_client.put(generate_uri.gsub("mandateid", mandateid.to_s), params.to_json, "Content-Type" => "application/json") do |req|
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
end