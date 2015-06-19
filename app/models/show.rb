class Show < ActiveRecord::Base
  belongs_to :place

  default_scope { order('date ASC') }
end
