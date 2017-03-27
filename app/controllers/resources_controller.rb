class ResourcesController < ApplicationController

  def set_to_standard
    current_user.standard!
    # redirect_to wikis_path
  end

end
