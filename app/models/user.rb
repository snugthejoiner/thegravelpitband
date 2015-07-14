class User < ActiveRecord::Base
  has_many :stories
  has_many :ratings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, presence: true

  # admin = developer
  def admin?
    self.role == 'admin'
  end

  # band members and friends of the family
  def commentator?
    self.role == 'commentator'
  end

  def modplus?
    admin? || commentator?
  end

  # citizens are confirmed users
  def citizen?
    self.role == 'citizen'
  end

  def sortation
    if self.role == 'admin'
      "A"
    elsif self.role == 'commentator'
      "B"
    else
      "C"
    end 
  end

end
