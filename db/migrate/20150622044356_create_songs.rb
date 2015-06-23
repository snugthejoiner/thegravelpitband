class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.text :lyrics
      t.references :release, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
