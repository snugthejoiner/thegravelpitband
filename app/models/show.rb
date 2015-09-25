class Show < ActiveRecord::Base
  belongs_to :place
  has_many :performances
  has_many :acts, through: :performances
  validates :date, presence: true

  def performances?
    self.performances.count > 0
  end

  def bill
    a = self.acts.pluck(:name)
    a.join(", ")
  end

  def description
    
    unless self.place.nil?
      self.place.name + " " +
      if self.place.address != nil && self.place.address != ""
        self.place.address + " "
      else
        ""
      end +
      if self.place.city != nil && self.place.city != ""
        "in " + self.place.city
      else
        ""
      end +
      if self.place.state != nil && self.place.state != ""
        ", " + self.place.state
      else
        ""
      end
    end

  end

  default_scope { order(date: :desc) }

end
