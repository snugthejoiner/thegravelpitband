class Release < ActiveRecord::Base
  has_many :songs
  has_many :stories
  has_many :ratings

  default_scope { order('release_date DESC') }
end
