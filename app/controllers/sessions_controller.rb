class SessionsController < ApplicationController # we need to inherit from this class to get all the Rails functionality
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Su sesión ha sido cerrada"
  end
end
