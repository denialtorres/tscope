CarrierWave.configure do |config| # required
  config.storage = :aws
  config.aws_bucket = ENV['amazon_bucket']

  config.aws_credentials = {
    access_key_id: ENV['amazon_access_key_id'],
    secret_access_key: ENV['amazon_secret_key'],
    region: ENV['amazon_region']
  }
  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  }
end
