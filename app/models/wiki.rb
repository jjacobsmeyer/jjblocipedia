class Wiki < ActiveRecord::Base
  belongs_to :user

  #scope :visible_to, -> (user) { premium ? publicly_viewable && privately_viewable : publicly_viewable }
  # scope :visible_to, -> (user) { user ? all : privately_viewable }

  scope :publicly_viewable, -> { where(private: false) }
  scope :privately_viewable, -> { where(private: true) }

  def public?
    !private
  end

  def premium
    role == 'premium'
  end


end
