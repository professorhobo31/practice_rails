class Current < ActiveSupport::CurrentAttributes
  attribute :user
end
# We setup this model in order for our application_controller code to be able to use the "Current" object to store a user for everyone surfing our app.
