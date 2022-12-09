class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_one :review
  has_one :organization, through: :event
end
