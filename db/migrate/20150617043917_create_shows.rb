class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.datetime :date
      t.references :place, index: true
      t.timestamps null: false
    end
  end
end
