require "faraday_middleware"

module LemonwayRuby
  module Client
    def conn_lemonway(request_content_type: :json)
      return @conn[request_content_type] if defined?(@conn) && @conn[request_content_type]
      @conn ||= {}
      @conn[request_content_type] = Faraday.new(
        url: "https://#{LemonwayRuby.configuration.url}",
        headers: {
          "Accept" => "application/json",
          "Content-Type" => "application/json"
        },
        proxy: LemonwayRuby.configuration.proxy
      ) do |conn|
        conn.request request_content_type
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
      end
      @conn[request_content_type]
    end

    def url_conf
      "/mb#{LemonwayRuby.configuration.return_url}/#{LemonwayRuby.configuration.webservice}/#{LemonwayRuby.configuration.api_version}"
    end

    def conn(request_content_type: :json)
      return @conn[request_content_type] if defined?(@conn) && @conn[request_content_type]
      @conn ||= {}
      @conn[request_content_type] = Faraday.new(
        url: "https://#{LemonwayRuby.configuration.url_auth}",
        headers: {
          "accept" => "application/json;charset=UTF-8",
          "Content-Type" => "application/x-www-form-urlencoded"
        },
        proxy: LemonwayRuby.configuration.proxy
      ) do |conn|
        conn.request request_content_type
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
      end
      @conn[request_content_type]
    end

    def auth
      conn(request_content_type: :url_encoded).post("/oauth/api/v1/oauth/token", {Grant_type: LemonwayRuby.configuration.grant_type}) do |req|
        req.headers["Authorization"] = LemonwayRuby.configuration.authorization
      end
    end

    def authenticated
      response = auth
      if response.success?
        access_token, token_type = response.body.values_at("access_token", "token_Type")
        response = yield(access_token, token_type)
      end
      response
    end
  end
end
