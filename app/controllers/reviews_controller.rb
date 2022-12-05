class ReviewsController < ApplicationController
  before_action :set_booking, only: [:create, :update, :new]

  def index
    @venue = Venue.find(params[:venue_id])
  end

  def new
    @venues = Venue.all
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
    @booking_id = @review.booking_id
    @booking = Booking.find(@booking_id)
    @user_id = @booking.user_id
    @user = User.find(@user_id)
    @venue_id = @booking.venue_id
    @venue = Venue.find(@venue_id)
  end

  def create
    set_booking
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    @venue = @review.booking.venue_id
    if @review.save
      redirect_to venue_path(@venue)
    else
      render "reviews/show", status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review)
          .permit(:comment,
                  :suited_for_calls,
                  :wifi_down,
                  :wifi_up,
                  :power_outlets,
                  :naural_light,
                  :rating,
                  :coffe_price,
                  :food_price,
                  :comment,
                  :title,
                  :photo)
  end
end
