class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :booking, null: false, foreign_key: true
      t.boolean :suited_for_calls
      t.integer :wifi_down
      t.integer :wifi_up
      t.boolean :power_outlets
      t.boolean :natural_light
      t.integer :rating
      t.integer :coffe_price
      t.integer :food_price
      t.text :comment

      t.timestamps
    end
  end
end
