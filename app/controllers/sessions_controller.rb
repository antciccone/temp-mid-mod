class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have successfully logged in!"
      redirect_to :root
    else
      flash[:notice] = user.errors.full_messages
      redirect_to :login
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
