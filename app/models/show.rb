class Show < ActiveRecord::Base
  
  belongs_to :place
  has_many :stories
  has_many :performances
  has_many :acts, through: :performances
  validates :date, presence: true
  NULL_ATTRS = %w( note )
  before_save :nil_if_blank

  default_scope { order(date: :desc) }

  def performances?
    self.performances.count > 0
  end

  def noted?
    self.note != nil
  end

  def storied?
    self.stories.count > 0
  end

  def datinator
    self.date.strftime('%A, %B %e, %Y')
  end

  def bill
    if self.performances?
    "with #{self.acts.pluck(:name).join(", ")}"
    else
    ""
    end
  end

  def complete_listing
    "#{self.date.strftime('%A, %B %e, %Y')} #{self.description} #{self.bill}"
  end

  def description
    
    unless self.place.nil?
      self.place.name + " " +
      self.place.name + " " +
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

  def descriptive
    
    unless self.place.nil?
      " at " + self.place.name + " " +
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

  def full_description
    
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

  def self.mod_last_month
    if ENV['RAILS_ENV'] == 'development'    # sqlite3 version
      where("strftime('%m', updated_at) + 0 = ?", 1.month.ago.month)
    else # postgres version
      where("extract(month from updated_at) = ? ", 1.month.ago.month)
    end
  end

  def self.created_last_month
    if ENV['RAILS_ENV'] == 'development'    # sqlite3 version
      where("strftime('%m', created_at) + 0 = ?", 1.month.ago.month)
    else # postgres version
      where("extract(month from created_at) = ? ", 1.month.ago.month)
    end
  end

  def self.today_in_pit
    if ENV['RAILS_ENV'] == 'development'    # sqlite3 version
      where("strftime('%m', date) + 0 = ? and strftime('%d', date) + 0 = ?", DateTime.now.month, DateTime.now.day)
    else # postgres version
      where("extract(month from date) = ? and extract(day from date) = ? ", DateTime.now.month, DateTime.now.day)
    end
  end


  def self.upcoming
    where("date >= ?", DateTime.now)
  end

  protected

  def nil_if_blank
    NULL_ATTRS.each { |attr| self[attr] = nil if self[attr].blank? }
  end

end
