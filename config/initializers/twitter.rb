TWITTER_KEY = 'JI6S08yaB0NlaKkWjeV3KAejm'
TWITTER_SECRET = 'hq8VmDsB7l8b1bWAUcFaozzdErtB8JXcrJIqDhAIQt6JBaSOs9'
oauthconsumer = OAuth::Consumer.new TWITTER_KEY, TWITTER_SECRET, {:site => "https://api.twitter.com"}
TWITTER_AUTH = oauthconsumer.get_request_token.authorize_url