class Review < ApplicationRecord
  belongs_to :booking
  has_one_attached :photo
  validates :rating, presence: true
  validates :booking, uniqueness: true
end
