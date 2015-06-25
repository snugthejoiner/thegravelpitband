class User < ActiveRecord::Base
  has_many :stories, :as => :storiable
  has_many :ratings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def admin?
    self.role == 'admin'
  end

  def citizen?
    self.role == 'citizen'
  end

end
