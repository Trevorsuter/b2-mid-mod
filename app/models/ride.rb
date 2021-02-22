class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :park_rides
  has_many :mechanics, through: :ride_mechanics
  has_many :parks, through: :park_rides
  validates_presence_of :name
  validates_presence_of :thrill_rating
end