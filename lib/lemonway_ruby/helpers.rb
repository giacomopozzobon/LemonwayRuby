module LemonwayRuby
  module Helpers
    def generate_uri
      name.split("::")[1..].join("/").downcase
    end

    def conn_client
      LemonwayRuby.conn_lemonway(request_content_type: :url_encoded)
    end

    def ensure_keys(hash, required_keys = %i[], optional_keys = %i[])
      # Ensure there are no extra keys
      hash.assert_valid_keys(required_keys + optional_keys)

      # Ensure all required keys are present
      required_keys.each do |key|
        raise(ArgumentError, "Required key not found: #{key}") unless hash.has_key?(key)
      end
      hash
    end
  end
end
