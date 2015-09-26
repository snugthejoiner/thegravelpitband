class AddNoteToShows < ActiveRecord::Migration
  def change
    add_column :shows, :note, :text
  end
end
