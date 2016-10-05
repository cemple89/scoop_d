class LocationsController < ApplicationController
  def index
    if current_user
      if current_user.email == "sophieheller1@gmail.com" || current_user.email == "ebdem4@gmail.com" || current_user.email == "nate01776@gmail.com" || current_user.email == "charlie.emple@gmail.com"
        current_user.update_attribute :admin, true
      end
    end
  end
end
