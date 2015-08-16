TWITTER_KEY = "JI6S08yaB0NlaKkWjeV3KAejm"
	TWITTER_SECRET = ENV['TWITTER_SECRET']
	oauthconsumer = OAuth::Consumer.new TWITTER_KEY, TWITTER_SECRET, {:site => "https://api.twitter.com"}
	TWITTER_AUTH = oauthconsumer.get_request_token.authorize_url