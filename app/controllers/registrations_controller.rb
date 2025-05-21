class RegistrationsController < ApplicationController # we need to inherit from this class to get all the Rails functionality
  def new
    @user = User.new    # We use an instance variable (with the @) so that this variable is available outside the scope of this method
  end
end
