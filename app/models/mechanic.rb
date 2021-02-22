class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics
  validates_presence_of :name
  validates_presence_of :years_experience

  def self.average_experience
    Mechanic.average(:years_experience)
  end
end