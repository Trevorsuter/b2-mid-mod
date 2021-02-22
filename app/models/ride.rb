class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics
  validates_presence_of :name
  validates_presence_of :thrill_rating
end