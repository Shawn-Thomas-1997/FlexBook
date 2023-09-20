class ListingsController < ApplicationController

  def index
    @listings = Listing.all

    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { listing: listing }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.new
    @user = current_user
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path(@listing.list), status: :see_other
  end

  private

  def listing_params
    params.require(:listing).permit(:category, :location, :details, :user_id)
  end
end
