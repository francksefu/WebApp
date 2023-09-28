class PostsController < ApplicationController
  # Create action - Handle the creation of a new post

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
