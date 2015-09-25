class Place < ActiveRecord::Base
  has_many :shows

  scope :abc, -> { order(name: :asc) }

  validates_uniqueness_of :name

end
