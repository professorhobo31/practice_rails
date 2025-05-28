class PasswordsController < ApplicationController
  before_action :require_user_logged_in   # we want only logged in users to have access to these actions. So we use a before_action and we go to application_controller to create the require_user_logged_in method, so that it is available in all controllers such as this one. Our new method should prevent execution of the bottom chunks if not a logged user

  def edit
  end

  def update
  end
end
