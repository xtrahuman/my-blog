class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :current_user, only: [:create, :edit, :update, :destroy]

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'You have successfully deleted this comment!'
    redirect_to user_post_path(current_user.id, @comment.post_id)
  end

  def create
    @comment = current_user.comments.new(comments_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:success] = 'your comment was saved successfully'
      redirect_to user_post_path(current_user.id, Post.find(params[:post_id]))
    else
      flash.now[:error] = 'your comment could not be saved'
      render :new
    end
  end

  def comments_params
    params.require(:comment).permit(:text)
  end
end
