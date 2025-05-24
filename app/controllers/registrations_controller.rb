class RegistrationsController < ApplicationController # we need to inherit from this class to get all the Rails functionality
  def new
    @user = User.new    # We use an instance variable (with the @) so that this variable is available outside the scope of this method. It'll be usable in all views!
  end

  def create
    @user = User.new(user_params)  # When we submit a form, all the data that we input will be stored in the params hash, but passing it here would be unsafe
    if @user.save                  # This conditional checks wether the input data goes through and actually gets saved to our DB
      session[:user_id] = @user.id # We store the user ID inside the :user_id param of the session object. This data will persist across multiple requests as long as the session is active
      redirect_to root_path, notice: "Su cuenta ha sido creada"
    else
      flash[:alert] = "Algo salio mal. Intente nuevamente"
      render :new, status: 400                  # Will go to app/views/registrations/new.html.erb and render the form again. IF WE DON'T ADD A STATUS, OUR ERROR FORMS WON'T SHOW UP
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation) # For security, this is a private method that we pass to the public create section. The require raises error if user
  end                                                                       # is not found. The ":email, ..." parameters we pass are the only thing we'll allow our form to set in our DB
end
