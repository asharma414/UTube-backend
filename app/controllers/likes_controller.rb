class LikesController < ApplicationController
  before_action :set_like, only: [:show, :update, :destroy]

  # POST /likes
  def create
    @like = Like.new(like_params)
    @like[:user_id] = curr_user.id
    if @like.save
      render json: @like, status: :created, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  def liked
    if curr_user
      if Like.find_by(user_id: curr_user.id, video_id: params[:id])
        like = Like.find_by(user_id: curr_user.id)
        if like[:dislike] == false
          render json: {liked: 'liked'}
        else
          render json: {liked: 'disliked'}
        end
      else
        render json: {liked: nil} 
      end
    end
  end

  # DELETE /likes/1
  def destroy
    render json: @like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find_by(video_id: params[:id], user_id: curr_user.id)
    end

    # Only allow a trusted parameter "white list" through.
    def like_params
      params.require(:like).permit(:video_id, :dislike)
    end
end
