class Listing < ApplicationRecord
  belongs_to :user
  # AT: added Wed 19/04
  has_many :bookings
  #
  validates :category, :name, :price, :description, :location, presence: true
  has_one_attached :photo
end
