CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAJ6C3IPPS5IIIYSTQ',
    aws_secret_access_key: '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'
  }
  config.fog_directory = 'snoozy-post'
end