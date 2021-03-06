class SessionsController < ApplicationController

  def new
  end

  def create
    # byebug
    user = User.find_by(email: params[:session][:email].downcase)
    # byebug
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
