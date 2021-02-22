class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics
  validates_presence_of :name
  validates_presence_of :years_experience

  def self.average_experience
    Mechanic.average(:years_experience)
  end

  def rides_by_thrill_rating
    rides.order(thrill_rating: :desc)
  end

  def add_ride(id)
    ride = Ride.find(id)
    RideMechanic.create(ride: ride, mechanic: self)
  end
end