class ApplicationController < ActionController::API

  def secret_key
      "blast0ise" #reference the secret key in another file
  end

  #given a payload, generate a token
  def encode(payload)
    JWT.encode(payload, secret_key, 'HS256')
  end

  #given a token, generate the original payload
  def decode(token)
     JWT.decode(token, secret_key, true, { algorithm: 'HS256' })[0]
  end

  def curr_user
    if decode(request.headers["Authentication"])
      user_id = decode(request.headers["Authentication"])['user_id']
      User.find(user_id)
    end
  end

end
