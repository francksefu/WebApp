class UsersController < ApplicationController
  # index action
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = Post.where(author_id: params[:id])
  end

  # We will add other action after
end
