# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers, dependent: :delete_all
  accepts_nested_attributes_for :passengers
end
