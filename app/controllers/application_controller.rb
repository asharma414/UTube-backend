class ApplicationController < ActionController::API

  #given a payload, generate a token
  def encode(payload)
    JWT.encode(payload, ENV['SECRET'], 'HS256')
  end

  #given a token, generate the original payload
  def decode(token)
      JWT.decode(token, ENV['SECRET'], true, { algorithm: 'HS256' })[0]
  end

  def curr_user
    if request.headers["Authentication"] != "null" && decode(request.headers["Authentication"])
      user_id = decode(request.headers["Authentication"])['user_id']
      User.find(user_id)
    end
  end

end
