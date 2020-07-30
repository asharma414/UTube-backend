class LikesController < ApplicationController
  before_action :set_like, only: [:update, :destroy]

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
       render json: Like.find_by(user_id: curr_user.id, video_id: params[:id])
      else
        render json: nil
      end
    end
  end

  def update
    @like[:dislike] = !@like[:dislike]
    @like.save
    render json: @like
  end

  # DELETE /likes/1
  def destroy
    render json: @like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def like_params
      params.require(:like).permit(:video_id, :dislike)
    end
end
