class UsersController < ApplicationController
  before_action :authenticate_user!
  # GET /users or /users.json
  def index
    @users = User.all.order(created_at: :asc)
    @post = Post.new
  end

  # GET /users/1 or /users/1.json
  
end
