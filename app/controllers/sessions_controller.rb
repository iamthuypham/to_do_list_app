class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      create_session(user)
      flash[:notice] = "Alright, #{user.name.capitalize}! It's time for something fun and productive"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end
 
  def destroy
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end
end
