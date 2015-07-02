class Song < ActiveRecord::Base
  belongs_to :release
  has_many :stories
  has_many :ratings

  def song_rating
    if self.ratings.present?
      "rated #{(self.ratings.sum(:rating_value)/self.ratings.count)} out of 7 by citizens of The Gravel Pit Universe"
    else
      "no ratings yet"
    end
  end

  default_scope { order('title ASC') }

end
