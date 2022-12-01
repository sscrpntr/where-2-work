class Venue < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo
  belongs_to :user
  has_many :venue_offers
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user

  scope :has_plugs, -> { where(power_outlets: true) }
  scope :has_calls, -> { where(suited_for_calls: true) }
  scope :has_light, -> { where(natural_light: true) }

  def all_reviews
    reviews.all
  end

  def average_rating
    sum = 0
    reviews.each do |review|
      sum += review.rating
    end
    return (sum.to_f / reviews.count).round(2) if reviews.count != 0
  end

  def opening_time_display
    if opening_time % 1 > 0
      if opening_time < 10
        return "0#{(opening_time - 0.5).to_i}:00"
      else
        return "#{(opening_time - 0.5).to_i}:00"
      end
    else
      return "#{opening_time.to_i}:30"
    end
  end

  def closing_time_display
    if opening_time % 1 > 0
      return "#{(closing_time - 5).to_i}:30"
    else
      return "#{closing_time.to_i}:30"
    end
  end
end
