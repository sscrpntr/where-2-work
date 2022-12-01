class FavoriteVenuesController < ApplicationController
  def create
    @favorite_venue = FavoriteVenue.create(venue_id: params[:venue_id], user: current_user)
    redirect_to venues_path
  end
end
