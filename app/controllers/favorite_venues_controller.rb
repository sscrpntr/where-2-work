class FavoriteVenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def create
    @favorite_venue = FavoriteVenue.create(venue_id: params[:venue_id], user: current_user)
    redirect_to venues_path
  end

  def index
    @favorites = current_user.favorite_venues
  end


  private

  def venue_params
    params.require(:favorite_venue).permit(:venue_id, user_id)
  end
end
