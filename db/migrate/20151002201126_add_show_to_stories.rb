class AddShowToStories < ActiveRecord::Migration
  def change
    add_reference :stories, :show, index: true, foreign_key: true
  end
end
