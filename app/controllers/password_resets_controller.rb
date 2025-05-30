class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      # Send mail
      PasswordMailer.with(user: @user).reset.deliver_now  # We want to use deliver_later so it is a background job so the browser doesn't lag
      redirect_to root_path, notice: "Se ha enviado un código a su correo para que pueda renovar su contraseña"
    else
      redirect_to root_path, alert: "Ese correo no registra una cuenta en nuestra base de datos"
    end
  end
end
