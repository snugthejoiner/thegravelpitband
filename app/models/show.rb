class Show < ActiveRecord::Base
  belongs_to :place
  has_many :acts
  has_many :acts, through: :performances

  default_scope { order('date DESC') }
end
