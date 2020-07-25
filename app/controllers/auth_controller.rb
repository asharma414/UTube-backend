class AuthController < ApplicationController

  def create # POST /login
    user = User.find_by(username: params["username"])
    if( user && user.authenticate(params["password"]) )
      #if the username AND passworld was found
      payload = {user_id: user.id}
      token = encode(payload)
      render json: {
        user_data: user.as_json({:include => {:subscribees => {:only => [:username, :id]}},:except => [:password_digest]}),
        token: token
      }
    else
      #if either the username OR password is incorrect
      render json: {
        error: true,
        message: "Incorrect username or password!"
      }
    end
  end

  def token_log_in
    token = decode(request.headers["Authentication"])
    user_id = token["user_id"]
    user = User.find(user_id)
    render json: user
  end

end
