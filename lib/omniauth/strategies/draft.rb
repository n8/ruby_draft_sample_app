module OmniAuth
  module Strategies
    class Draft < OmniAuth::Strategies::OAuth2
    

      option :client_options, {
        site: "https://draftin.com",
        # site: "http://127.0.0.1:3000",
        authorize_path: "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {name: raw_info["email"]}
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/people/me.json').parsed
      end
    end
  end
end
