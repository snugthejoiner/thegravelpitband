class AddTracknumberToSong < ActiveRecord::Migration
  def change
    add_column :songs, :tracknumber, :integer, default: 1
  end
end
