class Act < ActiveRecord::Base
    has_many :shows
    has_many :shows, through: :performance
end
