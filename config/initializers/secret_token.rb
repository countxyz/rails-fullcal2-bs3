require 'securerandom'

def secure_token
  token, token_file = SecureRandom.hex(64), Rails.root.join('.secret')
  
  if File.exist?(token_file)
    File.read(token_file).chomp
  else
    File.write(token_file, token)
    token
  end
end

Rails4Fullcal::Application.config.secret_key_base = secure_token
