class BookingsController < ApplicationController
  before_action :set_booking, only: :show
  before_action :set_venue, only: %i[:show :new :create :destroy]
  # fow now we don't need to set any venue before starting a method

  def index
    # @bookings = Booking.all
    @venues = Venue.all
    @user_bookings = Booking.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @venues = Venue.all
    @booking = Booking.new
  end

  def create
    set_venue
    @booking = Booking.new
    @booking.venue = @venue
    @booking.user = current_user
    @booking.save!
    redirect_to bookings_path
  end

  def destroy
    @booking.destroy
    redirect_to venue_bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end
end
