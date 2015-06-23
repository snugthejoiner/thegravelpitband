class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :title
      t.date :release_date

      t.timestamps null: false
    end
  end
end
