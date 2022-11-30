class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @venues = Venue.all
  end

  def about
    @user = current_user
  end
end
