class Booking < ApplicationRecord
  belongs_to :listing_id
  belongs_to :user_booking_id
end
