class RemoveVenueOfferIdFromVenue < ActiveRecord::Migration[7.0]
  def change
    remove_column :venues, :venue_offer_id, :integer
  end
end
