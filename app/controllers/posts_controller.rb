class PostsController < ApplicationController
	#Create action - Handle the creation of a new post

	def create
		@user = User.find(params[:author_id])
		@post = @user.posts.create(post_params)
		redirect_to user_path(@user)
	end

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