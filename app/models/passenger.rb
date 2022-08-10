class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  
  belongs_to :flight
  belongs_to :booking
end
