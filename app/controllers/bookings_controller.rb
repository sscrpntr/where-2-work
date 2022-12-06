class BookingsController < ApplicationController
  before_action :set_booking, only: :show
  before_action :set_venue, only: %i[:show :new :create :destroy]
  before_action :authorize_booking_access, only: %i[:show :create]
  # fow now we don't need to set any venue before starting a method

  def index
    # @bookings = Booking.all
    @venues = Venue.all
    @user_bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
    @user_bookings = Booking.where(user_id: current_user.id)
  end

  def new
    # @venues = Venue.all
    # @booking = Booking.new
  end

  def create
    set_venue
    if params[:booking]["date"].present?
      @booking = Booking.new
      @booking.venue = @venue
      @booking.user = current_user
      @booking.date = params[:booking]["date"]
      @booking.save!
      redirect_to booking_path(@booking)
    else
      flash[:alert] = "User not found."
      redirect_to venue_path(@venue)#, notice: 'You need to pick a date!'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
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

  # def authorize_booking_access
  #   @booking = Booking.find(params[:id, :current_user])
  # end
end
