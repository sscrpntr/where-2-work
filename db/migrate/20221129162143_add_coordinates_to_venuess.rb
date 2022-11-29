class AddCoordinatesToVenuess < ActiveRecord::Migration[7.0]
  def change
    add_column :venuesses, :latitude, :float
    add_column :venuesses, :longitude, :float
  end
end
