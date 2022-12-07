class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  has_one :review, dependent: :destroy
  validates :date, presence: true
  # validate :booking_in_the_past
  # validate :no_reservation_overlap

  # private

  # def booking_in_the_past
  #   if date < Date.today
  #     errors.add(:date, "can't be in the past")
  #   end
  # end

  # scope :overlapping, ->(period_start, period_end) do
  #   where "((date_start <= ?) and (date_end >= ?))", period_end, period_start
  # end

  # def no_reservation_overlap
  #   if (Booking.overlapping(date).any?)
  #     errors.add(:date_end, 'it overlaps another reservation')
  #   end
  # end
end
