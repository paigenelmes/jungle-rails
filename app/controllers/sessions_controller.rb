class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists and the password entered is correct
    if user && user.authenticate(params[:password])
      #Save user id in cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
      #If login fails, send them back to login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
