class UsersController < ApplicationController
  # GET /users or /users.json
  def index
    @users = User.all.order(created_at: :asc)
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end
end
