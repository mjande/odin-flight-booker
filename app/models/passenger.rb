class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  
  belongs_to :booking

  def flight
    booking.flight
  end
end
