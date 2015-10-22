class Release < ActiveRecord::Base
  has_many :songs
  has_many :stories
  has_many :ratings

  def rated?
    self.ratings.present? == true
  end

  def rated_by_user?(u)
    self.ratings.where(user_id: u).present? == true
  end

  def release_rating
    if self.rated?
      "Rated #{(self.ratings.sum(:rating_value)/self.ratings.count)} out of 7 by Citizens of The Gravel Pit Universe"
    else
      "No ratings yet"
    end
  end

  def user_release_rating(u)
    if self.ratings.where(user_id: u).present?
      "| Your rating is #{user_release_rating_value(u)}"
    else
      "| You have not rated this release yet"
    end
  end

  def user_release_rating_value(u)
    self.ratings.where(user_id: u).pluck(:rating_value).first
  end

  def user_release_rate(u)
    self.ratings.where(user_id: u).first
  end

  def smart_alpha
    self.title.sub(/^the /i, "")
  end

  def self.sorted_by_smart_alpha
    Release.all.sort_by(&:smart_alpha)
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

  default_scope { order('release_date DESC') }
end
