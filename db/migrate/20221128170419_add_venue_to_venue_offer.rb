class AddVenueToVenueOffer < ActiveRecord::Migration[7.0]
  def change
    add_reference :venue_offers, :venue, null: false, foreign_key: true
  end
end
