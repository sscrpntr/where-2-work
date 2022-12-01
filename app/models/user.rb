require 'speedtest'

class User < ApplicationRecord
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many :favorite_venues
has_many :favorited_by, through: :favorites_venues, source: :user

  def wifi_speed
    Speedtest::Test.new(
      download_runs: 4,
      upload_runs: 4,
      ping_runs: 4,
      download_sizes: [750, 1500],
      upload_sizes: [10_000, 400_000],
      debug: true
    ).run
  end
end
