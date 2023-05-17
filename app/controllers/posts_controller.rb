class PostsController < ApplicationController
  # GET /posts or /posts.json
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:comments).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to "/users/#{current_user.id}/posts"
    else
      flash[:danger] = "Couldn't create post"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
