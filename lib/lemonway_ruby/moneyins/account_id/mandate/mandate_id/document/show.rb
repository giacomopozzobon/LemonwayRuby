module LemonwayRuby
  module Moneyins
    module AccountId
      module Mandate
        module MandateId
          module Document
            extend Helpers
          
            class << self
              def show(accountid, mandateid)
                LemonwayRuby.authenticated do |access_token, token_type|
                  conn_client.get(generate_uri.gsub("mandateid", mandateid.to_s).gsub("accountid", accountid.to_s),  "Content-Type" => "application/json") do |req|
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