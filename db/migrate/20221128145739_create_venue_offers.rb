class CreateVenueOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :venue_offers do |t|
      t.float :coupon

      t.timestamps
    end
  end
end
