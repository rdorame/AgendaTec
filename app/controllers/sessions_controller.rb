class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(matricula: params[:session][:matricula].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or root_url
    else
      # Create an error message.
      flash.now[:danger] ='Usuario/contraseña incorrecto(s)' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
