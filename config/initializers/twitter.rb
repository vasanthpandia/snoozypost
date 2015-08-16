TWITTER_KEY = ENV['TWITTER_APP_KEY']
	TWITTER_SECRET = ENV['TWITTER_APP_SECRET']
	oauthconsumer = OAuth::Consumer.new TWITTER_KEY, TWITTER_SECRET, {:site => "https://api.twitter.com"}
	TWITTER_AUTH = oauthconsumer.get_request_token.authorize_url