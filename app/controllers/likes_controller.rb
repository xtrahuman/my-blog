class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    new_like = current_user.likes.new(
      user_id: current_user.id,
      post_id: @post.id
    )

    if new_like.save
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}"
    else
      render :new
    end
  end
end