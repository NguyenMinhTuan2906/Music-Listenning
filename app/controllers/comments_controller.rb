class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      render json: {
        content: render_to_string(@comment)
      }, status: :ok
    else
      render errors, status: :unauthorized
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :song_id
  end
end
