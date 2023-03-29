module LemonwayRuby
  module Accounts
    module AccountId
      module Documents
        module Upload
          extend Helpers

          class << self
            def upload_file(account_id, hash = {})
              required_keys = %i[buffer type name]
              params = ensure_keys(hash, required_keys)
              LemonwayRuby.post(generate_uri.gsub!("accountid", account_id.to_s), params)
            end
          end
        end
      end
    end
  end
end
