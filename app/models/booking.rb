class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :rent_start, :rent_end, :total_price, :status, presence: true

  # This bits marks a booking as pending
  def pending?
    status == 'pending'
  end

end
