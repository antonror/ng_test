class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  expose :comment

  def create
    if comment.save
      redirect_to movie_path(comment.movie_id), notice: 'Comment posted'
    else
      redirect_to movie_path(comment.movie_id), notice: 'Only one comment per movie'
    end
  end

  def destroy
    if comment.destroy
      redirect_to movie_path(comment.movie_id), notice: 'Comment deleted'
    else
      redirect_to movie_path(comment.movie_id), notice: 'You cannot delete this comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :movie_id, :content)
  end
end
