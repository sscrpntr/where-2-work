class Venue < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  belongs_to :venue_offer
  has_many :bookings
  has_many :reviews, through: :bookings
end
