class ReviewsController < ApplicationController
  before_action :set_booking
  def new
    @venues = Venue.all
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    set_booking
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    if @review.save
      redirect_to venues_path(@venue)
    else
      render "reviews/show", status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:comment, :suited_for_calls, :wifi_down, :wifi_up, :power_outlets, :naural_light,
                                   :rating, :coffe_price, :food_price, :comment, :title, :photo)
  end
end
