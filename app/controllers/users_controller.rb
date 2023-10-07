class UsersController < ApplicationController
  # index action
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post_most_recent = Post.where(author_id: params[:id]).limit(3).order(created_at: :desc)
  end

  # We will add other action after
end
