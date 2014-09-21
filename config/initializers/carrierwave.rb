CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJSHSPV76AS6RUTWQ',
    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'therabona'
end