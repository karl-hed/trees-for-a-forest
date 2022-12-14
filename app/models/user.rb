class User < ApplicationRecord
  geocoded_by :address
  has_many :bookings
  has_many :events, through: :bookings
  after_validation :geocode, if: :will_save_change_to_address?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  enum achievement_level: {
    bronze: 0,
    silver: 1,
    gold: 2
  }
end
