class PagesController < ApplicationController
  # The home pages will be the listings index. We can remove this home method once we have that.
  def home
    @listings = Listing.all
    @users = User.all
    # user = User.find(params[:id])
    # @username = user.username
  end

  def profile
    @user = current_user
  end

  def certifications
    @user = current_user
  end

  def calendar
    @user = current_user
  end
end
