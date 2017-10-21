CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAJW2UJEO2REBEGW6Q"],

      aws_secret_access_key: ENV["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"],

      region:                ENV["us-east-1"]

    }
    config.fog_directory  = ENV["buarvr"]


  else
    config.storage :file
  end
end
