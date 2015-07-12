class ChangeReleaseDateDataType < ActiveRecord::Migration
  def change
    change_column :releases, :release_date, :datetime
  end
end
