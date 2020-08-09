class VideosController < ApplicationController
  before_action :set_video, only: [:show, :update, :destroy]

  # GET /videos
  def index
    if params[:query] && params[:query].length != 0
      term = params[:query].downcase
      @videos = Video.where('LOWER(title) like ?', "%#{term}%").or(Video.where('LOWER(description) like ?', "%#{term}%"))
    else 
      @videos = Video.where(public: true)
    end
    render json: @videos
  end

  # GET /videos/1
  def show
    render json: @video, serializer: VideoShowSerializer
  end

  # POST /videos
  def create
    if curr_user
      @video = Video.new(video_params)
      @video.user_id = curr_user.id
      if @video.save
        render json: @video, status: :created, location: @video
      else
        render json: @video.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /videos/1
  def update
    if @video.update(video_params)
      render json: @video
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # DELETE /videos/1
  def destroy
    @video.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def video_params
      params.require(:video).permit(:title, :description, :public, :clip, :thumbnail, :genre_id)
    end
end
