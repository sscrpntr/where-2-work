class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    # @markers = [{ lat: @laptop.latitude, lng: @laptop.longitude }]
    @booking = Booking.new
    @venues = Venue.all
    @average_review = average_reviews(@venue)
  end

  private

  def venue_params
    params.require(:venue).permit(:user, :category, :name, :address, :website, :power_outlets, :natural_light, :suited_for_calls, :opening_time, :closing_time)
  end

  def average_reviews(venue)
    reviews = Review.where(venue:)
    sum = 0
    reviews.each do |review|
      sum += review.rating
    end
    return (sum.to_f / reviews.count).round(2)
  end
end
