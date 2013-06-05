require File.expand_path('lib/omniauth/strategies/draft', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :draft, ENV['OAUTH_ID'], ENV['OAUTH_SECRET']
end
