class PostsController < ApplicationController
  # Create action - Handle the creation of a new post

  def index
    @post = Post.includes(:comments).where(author_id: params[:user_id])
    @user = User.find_by(id: params[:user_id])
    @user_check = User.all
  end

  def new
    @post = @user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to @post
    else
      flash.now[:alert] = 'creation failed'
      render 'new'
    end
  end

  def show
    @post = Post.includes(:comments).find_by(id: params[:id])
    @comment = Comment.all.order(created_at: :desc)
    @user = User.find_by(id: params[:user_id])
    @user_check = User.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
