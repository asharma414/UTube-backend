class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private
    
    def comment_params
      params.require(:comment).permit(:user_id, :video_id, :content)
    end

end
