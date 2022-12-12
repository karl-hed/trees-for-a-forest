class Event < ApplicationRecord
  belongs_to :organization
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  # include PgSearch::Model
  # multisearchable against: [:name, :description, :region]

  # pg_search_scope :search_by_name_and_description_and_region,
  #   against: [:name, :description, :region],
  #   associated_against: {
  #     organization: [:name]
  #   },
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
end
