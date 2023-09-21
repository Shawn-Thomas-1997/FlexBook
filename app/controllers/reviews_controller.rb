class ReviewsController < ApplicationController
  before_action :set_listing, only: %i[new create]

  def create
    @review = Review.new(review_params)
    @review.listing = @listing
    if @review.save
      redirect_to listing_path(@listing)
    else
      redirect_to listing_path(@listing), status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to listing_path(@review.listing), status: :see_other
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
