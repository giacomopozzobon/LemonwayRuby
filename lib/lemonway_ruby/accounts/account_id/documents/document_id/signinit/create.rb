module LemonwayRuby
  module Accounts
    module AccountId
      module Documents
        module DocumentId
          module Signinit
            extend Helpers

            class << self 
              def sign_document_init(accountid, documentid, hash = {}, other_params = {})
                LemonwayRuby.authenticated do |access_token, token_type|
                  required_keys = %i[type returnUrl errorUrl]
                  params = ensure_keys(hash, required_keys)
                  params = params.merge(other_attrs)

                  conn_client.post(generate_uri.gsub("accountid", accountid).gsub("documentid", documentid), params.to_json, "Content-Type" => "application/json") do
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