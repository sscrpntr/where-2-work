class Venue < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :venue_offers
  has_many :bookings
  has_many :reviews, through: :bookings
end
