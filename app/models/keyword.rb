class Keyword < ApplicationRecord
  def grab_tweets    
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "Npc5ideB1SzbwHn7492syZtVo"
      config.consumer_secret     = "GkRjASfNwQilZvE373hfUSqQRIrAmU2nV6ZrG7zAMDZfyW8El9"
      config.access_token        = "20212372-hhUf3F8LOnmfYCMrxbkWBAbs9lbMytek7ZR33i0M9"
      config.access_token_secret = "SnsMgcgECBSiUG5C6kH7E10dKH4FQL0EDTbj4UzXPwH7n"
    end
    
    client.search(self.word, result_type: "recent").take(3).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end
