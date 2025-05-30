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

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to root_path, alert: "El link para resetear su contraseña ha expirado"
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: "Su nueva contraseña ha sido registrada"
    else
      render :edit, status: :bad_request
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
