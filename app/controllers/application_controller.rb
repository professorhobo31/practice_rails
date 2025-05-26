class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_current_user # This line tells our app that before calling an action (any action on all controllers) it should run the method set bellow

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])   # Changed "User.find" which expects to always work, to "User.find_by"
    end
  end
end
# After this change to the Current.user system, we need to go to the views that referenced our login status (in our case, app/views/main/index.html.erb)
