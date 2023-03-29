module LemonwayRuby
  module Accounts
    module AccountId
      module Documents
        module DocumentId
          module Signinit
            extend Helpers

            class << self
              def sign_document_init(accountid, documentid, hash = {}, other_attrs = {})
                required_keys = %i[type returnUrl errorUrl]
                params = ensure_keys(hash, required_keys)
                params = params.merge(other_attrs)
                LemonwayRuby.post(generate_uri.gsub("accountid", accountid.to_s).gsub("documentid", documentid.to_s), params)
              end
            end
          end
        end
      end
    end
  end
end
