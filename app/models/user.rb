class User < ActiveRecord::Base
  has_many :wikis
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  after_initialize :init

  def init
    self.role ||= 'standard'
  end

  def admin?
    role == 'admin'
  end

  def premium?
    role == 'premium'
  end

  def make_premium!
    self.role = 'premium'
    save!
  end

  def make_standard
    self.role = 'standard'

    transaction do
      wikis.update_all(private: false)
      save!
    end
  end


end
