class PostsController < ApplicationController
  load_and_authorize_resource
  skip_before_action :verify_authenticity_token
  before_action :current_user, only: %i[create edit update destroy]

  def index
    @user = User.find(params[:user_id])
    @posts_user = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'You have successfully deleted this post!'
    redirect_to user_path(current_user)
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post was sucessfully created'
          redirect_to "/users/#{current_user.id}"
        else
          flash.now[:error] = 'post was not created'
          render :new
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
