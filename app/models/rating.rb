class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  belongs_to :release

  validates :rating_value, numericality: { greater_than: 0, less_than_or_equal_to: 7, message: "%{rating_value} is not a valid vote." }

end
