class PostsController < ApplicationController
  # Create action - Handle the creation of a new post

  def index
    @post = Post.where(author_id: params[:user_id])
    @comment = Comment.all
    @user = User.find_by(id: params[:user_id])
    @user_check = User.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.all
    @user = User.find_by(id: params[:user_id])
    @user_check = User.all
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
