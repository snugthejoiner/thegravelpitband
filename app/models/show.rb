class Show < ActiveRecord::Base
  belongs_to :place
  has_many :performances
  has_many :acts, through: :performances

  def performances?
    self.performances.count > 0
  end

  default_scope { order('date DESC') }
end
