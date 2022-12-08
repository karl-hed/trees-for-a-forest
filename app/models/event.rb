class Event < ApplicationRecord
  belongs_to :organization
  has_many :bookings
  has_many :users, through: :bookings
end
