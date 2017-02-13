class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have created an account"
      redirect_to login_path
    else
      flash[:notice] = "Username and password do not match"
      redirect_to new_user_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
