class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @venues = Venue.all
    @venues = Venue.has_plugs if params[:has_plugs].present?
    @venues = Venue.has_calls if params[:has_calls].present?
    @venues = Venue.has_light if params[:has_light].present?
    @venues = Venue.has_wifi if params[:has_wifi].present?
    if params[:search].present?
      sql_query = <<~SQL
        venues.category @@ :query
        OR venues.name @@ :query
        OR venues.address @@ :query
      SQL
      @search_term = params[:search]
      @venues = @venues.where(sql_query, query: "%#{@search_term}%")
    end
    @markers = @venues.geocoded.map do |venue|
      { lat: venue.latitude, lng: venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: { venue: }) }
    end

    @user_location = Geocoder.search(request.remote_ip).first.coordinates
    @markers << { lat: @user_location[0], lng: @user_location[1] }
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to venue_path(@venue), notice: 'Venue was successfully created.'
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

  def favorite
    @venue = Venue.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorite_venues << @venue
      redirect_to :back, notice: 'Added to favorites'

    elsif type == "unfavorite"
      current_user.favorite_venues.delete(@venue)
      redirect_to :back, notice: 'Removed from favorites'

    else
      redirect_to :back, notice: 'Nothing happened.'
    end
    raise
  end

  private

  def venue_params
    params.require(:venue).permit(:user_id, :category, :name, :address, :website, :power_outlets, :natural_light,
                                  :suited_for_calls, :opening_time, :closing_time, :wifi, :photo)
  end
end
