class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.references :user, null: false, foreign_key: true
      t.references :venue_offer, null: false, foreign_key: true
      t.string :category
      t.string :name
      t.string :address
      t.string :website
      t.boolean :power_outlets
      t.boolean :natural_light
      t.boolean :suited_for_calls
      t.float :opening_time
      t.float :closing_time

      t.timestamps
    end
  end
end
