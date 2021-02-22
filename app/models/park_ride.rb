class ParkRide < ApplicationRecord
  belongs_to :park
  belongs_to :ride
  validates_presence_of :park
  validates_presence_of :ride
end