class Collaborator < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki

  def user_email
    user.email
  end
  
end
