class PagesController < ApplicationController
  # The home pages will be the listings index. We can remove this home method once we have that.
  def home
    @listings = Listing.all
    if params[:query].present?
      @listings = @listings.search_by_category(params[:query])
    end
    @users = User.all
  end

  def profile
    @user = current_user
    @listings = @user.listings
    @users = User.all
  end

  def certifications
    @user = current_user
  end

  def calendar
    @user = current_user
  end

  def trainer_view
    @user = current_user
  end

  def client_view
    @user = current_user
  end
end
