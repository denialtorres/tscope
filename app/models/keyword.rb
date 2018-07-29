class Keyword < ApplicationRecord
  has_many :tweets
  
  def grab_tweets    
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "Npc5ideB1SzbwHn7492syZtVo"
      config.consumer_secret     = "GkRjASfNwQilZvE373hfUSqQRIrAmU2nV6ZrG7zAMDZfyW8El9"
      config.access_token        = "20212372-hhUf3F8LOnmfYCMrxbkWBAbs9lbMytek7ZR33i0M9"
      config.access_token_secret = "SnsMgcgECBSiUG5C6kH7E10dKH4FQL0EDTbj4UzXPwH7n"
    end
    
    client.search(self.word, result_type: "recent").take(100).collect do |tweet|
      new_tweet = Tweet.new
      new_tweet.tweet_id= tweet.id.to_s
      new_tweet.tweet_created_at= tweet.created_at
      new_tweet.text= tweet.text
      new_tweet.user_uid= tweet.user.id
      new_tweet.user_name= tweet.user.name
      new_tweet.user_screen_name= tweet.user.screen_name
      new_tweet.user_image_url =tweet.user.profile_image_url
      new_tweet.keyword =self
      
      new_tweet.save
    end
  end
  
  def self.grab_all_tweets
    Keyword.all.each do |keyword|
      keyword.grab_tweets
    end
  end
end
