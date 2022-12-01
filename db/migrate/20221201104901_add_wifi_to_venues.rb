class AddWifiToVenues < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :wifi, :boolean
  end
end
