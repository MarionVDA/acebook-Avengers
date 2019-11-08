class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @wall = Wall.new(params[:id])
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

  end

  def update
    current_user.update_attributes(user_params)
    flash[:notice] = 'Profile was successfully edited.'
    redirect_to posts_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation)
  end

end
