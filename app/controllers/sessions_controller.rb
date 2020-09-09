class SessionsController < ApplicationController

  layout "login", :only => [ :new ]

  def new
  	render(:layouts => "layout/login")
  end

  def create
  	user = User.find_by(name: params[:session][:name].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
      redirect_to overview_path
  	else
  		flash.now[:danger] = "Invalid name/password combination"
      redirect_to root_path
  	end
  end

  def destroy
    log_out
    redirect_to login_url
  end
end
