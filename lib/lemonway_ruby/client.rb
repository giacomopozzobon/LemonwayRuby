require "net/http"
require "json"

module LemonwayRuby
  module Client
    def get(uri, params=nil)
      request(uri, method: "GET", params: params)
    end

    def post(uri, body)
      request(uri, body: body, method: "POST")
    end

    def put(uri, body)
      request(uri, body: body, method: "PUT")
    end

    private

    def request(path, body: nil, method: "GET", params: nil)
      uri = URI.parse("#{LemonwayRuby.configuration.url_api}/#{path}")
      http_args = [uri.host, uri.port]
      if LemonwayRuby.configuration.proxy_url
        proxy_uri = URI.parse(LemonwayRuby.configuration.proxy_url)
        http_args += [proxy_uri.hostname, proxy_uri.port, proxy_uri.user, proxy_uri.password]
      end
      headers = {
        "content-type" => "application/json",
        "authorization" => "Bearer #{access_token}",
        "psu-ip-address" => LemonwayRuby.configuration.psu_ip_address
      }
      # puts "---> #{method} : #{uri.path} #{body&.to_json}"
      http = Net::HTTP.new(*http_args)
      http.use_ssl = true
      uri_path =
        if params.present?
          "#{uri.path}?#{params.map{ |k, v| "#{k}=#{v}" }.join("&")}"
        else
          uri.path
        end
      res = http.send_request(method, uri_path, body&.to_json, headers)
      JSON.parse(res.body)
    end

    def access_token
      uri_auth = URI.parse(LemonwayRuby.configuration.url_auth)
      req = Net::HTTP::Post.new(uri_auth)
      req.set_form_data("Grant_type" => "client_credentials")
      req["Authorization"] = LemonwayRuby.configuration.authorization
      http_args = [uri_auth.host, uri_auth.port]
      if LemonwayRuby.configuration.proxy_url
        proxy_uri = URI.parse(LemonwayRuby.configuration.proxy_url)
        http_args += [proxy_uri.hostname, proxy_uri.port, proxy_uri.user, proxy_uri.password]
      end
      res = Net::HTTP.start(*http_args, use_ssl: true) { |http| http.request(req) }
      JSON.parse(res.body)["access_token"]
    end
  end
end
