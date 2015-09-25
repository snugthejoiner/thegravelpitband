class Act < ActiveRecord::Base
  has_many :shows
  has_many :shows, through: :performance

  default_scope { order('name ASC') }

  validates_uniqueness_of :name

end
