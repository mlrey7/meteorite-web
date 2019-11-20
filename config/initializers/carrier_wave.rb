if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['S3_ACCESS_KEY'],                        # required unless using use_iam_profile
      aws_secret_access_key: ENV['S3_SECRET_KEY'],                        # required unless using use_iam_profile
      use_iam_profile:       true,                         # optional, defaults to false
      region:                'ap-southeast-1',                  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = 'meteorite-web'                                      # required
    config.fog_public     = false                                                 # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
  end
end
