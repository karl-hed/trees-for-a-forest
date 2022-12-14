class Event < ApplicationRecord
  belongs_to :organization
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
end
