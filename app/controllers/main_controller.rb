class MainController < ApplicationController # we need to inherit from this class to get all the Rails functionality
  def index
    # flash.now[:notice] = "Ud. se ha logueado exitosamente"            # These flashes are inherited from the main controller. We pass a name thru a symbol
    # flash.now[:alert] = "El mail o la contraseña son incorrectos"     # They are meant to make our main landing page render these alrerts, but not so our about page
    # flash.now[:warning] = "Algo salió mal, recargue la página"

    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
end
