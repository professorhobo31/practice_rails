class SessionsController < ApplicationController # we need to inherit from this class to get all the Rails functionality
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])  # This logic checks that the secure password matches our user before logging them in
      session[:user_id] = user.id
      redirect_to root_path, notice: "Bienvenido de vuelta"
    else
      flash[:alert] = "Email o contraseña inválidos"
      render :new, status: 400
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Su sesión ha sido cerrada"
  end
end
