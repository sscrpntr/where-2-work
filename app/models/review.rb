class Review < ApplicationRecord
  belongs_to :booking
  has_one_attached :photo
end
