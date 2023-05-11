class PostsController < ApplicationController
  # GET /posts or /posts.json
  def index
    @user = User.find(params[:user_id])
    @post = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end
end
