class SessionsController < ApplicationController


  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:notice] = "You have successfully logged in!"
      session[:user_id] = user.id
      redirect_to links_path
    else
      flash[:notice] = "Password and user name do not match"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
