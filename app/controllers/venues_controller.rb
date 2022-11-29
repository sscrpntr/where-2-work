class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @venues = Venue.all
    if params[:search].present?
      sql_query = <<~SQL
        venues.category @@ :query
        OR venues.name @@ :query
        OR venues.address @@ :query
      SQL
      @search_term = params[:search]
      @venues = @venues.where(sql_query, query: "%#{@search_term}%")
    end
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to venues_path(@venue), notice: 'Venue was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @markers = [{ lat: @venue.latitude, lng: @venue.longitude }]
    @booking = Booking.new
    @venues = Venue.all
  end

  private

  def venue_params
    params.require(:venue).permit(:user_id, :category, :name, :address, :website, :power_outlets, :natural_light,
                                  :suited_for_calls, :opening_time, :closing_time)
  end
end
