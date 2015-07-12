class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  belongs_to :release

  def rating_title
    if self.song
      self.song.title
    else
      self.release.title
    end
  end

  def rating_type
    if self.song
      "the song "
    else
      "the release "
    end
  end

  def rating_sort
    self.rating_type + (7 - self.rating_value).to_s
  end

  def self.sorted_by_rating_type
    Rating.all.sort_by(&:rating_sort)
  end

  validates :rating_value, numericality: { greater_than: 0, less_than_or_equal_to: 7, message: "%{rating_value} is not a valid vote." }

end
