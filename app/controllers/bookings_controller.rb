class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @listing = Listing.find(params[:listing_id])
    @review = Review.new
  end

  def new
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = current_user.bookings.new(booking_params)
    @booking.listing = @listing
    if @booking.save
      redirect_to listing_booking_path(@listing, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to listing_booking_path(@booking), status: :see_other
  end

  def load_partial
    partial_name = params[:name]

    if partial_name == "client_view"
      render partial: "client_view", locals: { booking: @bookings }
    elsif partial_name == "trainer_view"
      render partial: "trainer_view", locals: { booking: @bookings }
    else
      render plain: "Invalid partial name", status: :bad_request
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :comment, :listing_id, :user_id)
  end
end
