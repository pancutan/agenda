class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  def new
  end

  def create
    # binding.pry
    user = User.find_by(email: params[:email])
	  if user and user.authenticate(params[:password])
		  session[:user_id] = user.id
		  redirect_to landing_bienvenido_url
	  else
		  redirect_to landing_bienvenido_url, alert: "Combinacion de usuario / password invalida"
	  end
  end

  def destroy
    session[:user_id] = nil
  end
end
