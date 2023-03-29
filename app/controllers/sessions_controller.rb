class SessionsController < ApplicationController

  def new
  end

  def create
    # If the user is authenticated with credentials
    if user = User.authenticate_with_credentials(params[:email], params[:password])
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
