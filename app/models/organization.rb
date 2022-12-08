class Organization < ApplicationRecord
  has_many :events
  has_many :bookings, through: :events
  has_many :reviews, through: :bookings
end
