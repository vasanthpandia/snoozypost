TWITTER_KEY = Rails.application.secrets.twitter_api_key
TWITTER_SECRET = Rails.application.secrets.twitter_secret
oauthconsumer = OAuth::Consumer.new TWITTER_KEY, TWITTER_SECRET, {:site => "https://api.twitter.com"}
TWITTER_AUTH = oauthconsumer.get_request_token.authorize_url