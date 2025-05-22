class RegistrationsController < ApplicationController # we need to inherit from this class to get all the Rails functionality
  def new
    @user = User.new    # We use an instance variable (with the @) so that this variable is available outside the scope of this method. It'll be usable in all views!
  end

  def create
    @user = User.new(user_params)  # When we submit a form, all the data that we input will be stored in the params hash, but passing it here would be unsafe
    if @user.save                  # This conditional checks wether the input data goes through and actually gets saved to our DB
      redirect_to root_path, notice: "Cuenta creada"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
