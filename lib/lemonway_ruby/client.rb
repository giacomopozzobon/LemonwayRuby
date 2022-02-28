module LemonwayRuby
  module Client
    def conn_lemonway(request_content_type: :json)
      return @conn[request_content_type] if defined?(@conn) && @conn[request_content_type]
      @conn ||= {}
      @conn[request_content_type] = Faraday.new(
        url: "https://#{LemonwayRuby.configuration.url}",
        headers: { 'Accept' => 'application/json', 
                   'Content-Type' => 'application/json' }
      ) do |conn|
        conn.request request_content_type
        conn.response :json, :content_type => /\bjson$/
        conn.adapter Faraday.default_adapter
      end
      @conn[request_content_type]
    end

    def url_conf
      "/mb/#{LemonwayRuby.configuration.return_url}/#{LemonwayRuby.configuration.webservice}/#{LemonwayRuby.configuration.api_version}"
    end
  end
end