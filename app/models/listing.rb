class Listing < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
    pg_search_scope :search_by_category,
    against: [ :category ],
    associated_against: {
      user: [ :fullname ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
