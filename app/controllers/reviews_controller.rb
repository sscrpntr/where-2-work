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
    @venue_id = @review.booking.venue_id
    @venue = Venue.find(@venue_id)
    @user_id = @booking.user_id
    @user = User.find(@user_id)
    if params[:review][:speedtest] == "1"
      speed_results = test_speed
      @review.wifi_down = speed_results.pretty_download_rate
      @review.wifi_up = speed_results.pretty_upload_rate
    end
    if @review.save
      redirect_to venue_path(@venue)
    else
      render "reviews/show", status: :unprocessable_entity
    end
  end

  def test_speed
    Speedtest::Test.new(
      download_runs: 4,
      upload_runs: 4,
      ping_runs: 4,
      download_sizes: [750, 1500],
      upload_sizes: [10000, 400000],
      debug: true
      ).run
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
                  :photo,
                  :speedtest
                )
  end
end
