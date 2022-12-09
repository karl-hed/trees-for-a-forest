class Organization < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :bookings, through: :events
  has_many :reviews, through: :bookings
end
