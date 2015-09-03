class UsersController < ApplicationController

  def downgrade
    current_user.make_standard
    redirect_to edit_user_registration_path 
  end

end
