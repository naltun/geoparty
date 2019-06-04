class ApplicationController < ActionController::API

  private

  def secret_key
    Rails.application.credentials.geoparty[:secret_key]
  end

  def encode(payload)
    JWT.encode(payload, secret_key, 'HS256')
  end

  def decode(token)
    JWT.decode(token, secret_key, true, {algorithm: 'HS256'})[0]
  end

end
