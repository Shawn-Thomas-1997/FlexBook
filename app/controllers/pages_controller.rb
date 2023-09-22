class PagesController < ApplicationController
  # The home pages will be the listings index. We can remove this home method once we have that.
  def home
    @listings = Listing.all
    if params[:query].present?
      @listings = @listings.search_by_category(params[:query])
    end
    @users = User.all
    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { listing: listing }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def profile
    @user = current_user
    @listings = @user.listings
    @users = User.all
  end

  def calendar
    @user = current_user
  end
end
