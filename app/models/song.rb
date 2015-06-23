class Song < ActiveRecord::Base
  belongs_to :release
  has_many :stories
  has_many :ratings

  default_scope { order('title ASC') }

end
