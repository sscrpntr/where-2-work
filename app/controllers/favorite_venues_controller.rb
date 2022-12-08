class FavoriteVenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def create
    @favorite_venue = FavoriteVenue.create(venue_id: params[:venue_id], user: current_user)
    respond_to do |format|
      format.html {redirect_to venues_path}
      format.json
    end

  end

  def destroy
    @favorite_venue = FavoriteVenue.find(params[:id]).destroy
    respond_to do |format|
      format.html {
        if current_user.favorite_venues.present?
          redirect_to user_favorite_venues_path(current_user)
        else
          redirect_to venues_path
        end
      }
      format.json
    end

  end

  def index
    @favorites = current_user.favorite_venues
  end

  def toggle_favorite
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
  end

  private

  def venue_params
    params.require(:favorite_venue).permit(:venue_id, user_id)
  end
end
