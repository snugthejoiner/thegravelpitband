class User < ActiveRecord::Base
  has_many :stories
  has_many :ratings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, presence: true
  validates :name, length: { maximum: 122 } #because the name Pablo Diego José Francisco de Paula Juan Nepomuceno María de los Remedios Cipriano de la Santísima Trinidad Ruiz y Picasso has 122 characters

  after_create :send_new_user_email

  scope :monthly_subscriber, -> { where('subscription = ?' , 'Monthly') }
  scope :comment_subscriber, -> { where('subscription = ?' , 'Monthly') }
  scope :relevant_comment_subscriber, -> { where('subscription = ?' , 'Never') }

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

  def send_new_user_email
    UserMailer.new_user(self).deliver_now
  end

end
