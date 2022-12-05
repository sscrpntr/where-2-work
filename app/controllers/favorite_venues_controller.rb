class FavoriteVenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  # def create
  #   @favorite_venue = FavoriteVenue.create(venue_id: params[:venue_id], user: current_user)
  #   redirect_to venues_path
  # end

  def index
    @favorites = current_user.favorite_venues
  end

  def new
    @favorites = FavoriteVenue.new
  end

  def create
    @favorites = FavoriteVenue.new(venue_id: params[:venue_id], user: current_user)
    if @favorites.save!
      redirect_to venues_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end

# <%= link_to "btn", user_favorite_venues_path(current_user,venue_id: venue.id), data: {turbo_method: :post} %>
