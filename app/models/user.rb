class User < ApplicationRecord
  # has_many :listings, :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings
  has_many :bookings
  validates :first_name, :last_name, :email, :bio, :location, presence: true
end
