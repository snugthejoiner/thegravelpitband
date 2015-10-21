class AddSubscriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscription, :string, :default => 'Never'
  end
end
