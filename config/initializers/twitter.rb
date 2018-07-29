$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["consumer_key"]
  config.consumer_secret     = "GkRjASfNwQilZvE373hfUSqQRIrAmU2nV6ZrG7zAMDZfyW8El9"
  config.access_token        = "20212372-hhUf3F8LOnmfYCMrxbkWBAbs9lbMytek7ZR33i0M9"
  config.access_token_secret = "SnsMgcgECBSiUG5C6kH7E10dKH4FQL0EDTbj4UzXPwH7n"
end