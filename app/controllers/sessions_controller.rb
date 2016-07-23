class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remeber user
      redirect_to user
    else
      flash.now[:danger] = "Invaild email/password combination"
      render 'new'
    end
  end

  def destory
    log_out if logged_in?
    redirect_to root_url
  end
end
