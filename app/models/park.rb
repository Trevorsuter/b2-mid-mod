class Park < ApplicationRecord
has_many :park_rides
has_many :rides, through: :park_rides
validates_presence_of :name
validates_presence_of :admissions
end