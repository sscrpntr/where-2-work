class AddAttributesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_owner, :boolean
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :venue_owned, :integer
  end
end
