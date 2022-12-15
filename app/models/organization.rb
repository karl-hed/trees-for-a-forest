class Organization < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :bookings, through: :events
  has_many :reviews, through: :bookings

  def average_rating
    number_of_reviews = reviews.count
    return number_of_reviews if number_of_reviews.zero?

    return reviews.pluck(:rating).sum / number_of_reviews
  end
end
