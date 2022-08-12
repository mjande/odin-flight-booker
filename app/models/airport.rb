# frozen_string_literal: true

class Airport < ApplicationRecord
  validates :code, presence: true

  has_many :departing_flights, class_name: 'Flight', foreign_key: 'origin_id', dependent: :delete_all, inverse_of: 'origin'
  has_many :arriving_flights, class_name: 'Flight', foreign_key: 'destination_id', dependent: :delete_all, inverse_of: 'destination'
end
