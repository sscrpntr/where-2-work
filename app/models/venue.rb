class Venue < ApplicationRecord
  belongs_to :user
  belongs_to :venue_offer
  has_many :bookings
  has_many :reviews, through: :bookings
end
