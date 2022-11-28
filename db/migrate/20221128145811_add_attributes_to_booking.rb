class AddAttributesToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :venue, null: false, foreign_key: true
  end
end
