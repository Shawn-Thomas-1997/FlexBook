class Review < ApplicationRecord
  belongs_to :listing
  validates :content, presence: true
end
