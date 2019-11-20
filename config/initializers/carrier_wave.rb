if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key  => ENV['S3_SECRET_KEY'],
      :region => 'ap-southeast-1',
      :endpoint => ENV['S3_ENDPOINT']
    }
    config.fog_directory = "meteorite-web/"
  end
end
