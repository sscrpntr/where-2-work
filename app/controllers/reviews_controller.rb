class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    if review.save
      redirect_to venues_path(@venue)
    else
      render "venues/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :suited_for_calls, :wifi_down, :wifi_up, :power_outlets, :naural_light, :rating, :coffe_price, :food_price, :comment, :title)
  end
end
