class Listing < ApplicationRecord
  belongs_to :user
  validates :category, :name, :price, :description, :location, presence: true
  has_one_attached :photo
end
