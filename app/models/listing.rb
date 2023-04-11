class Listing < ApplicationRecord
  belongs_to :user
  validates :category, :name, :price, :description, :location, presence: true
end
