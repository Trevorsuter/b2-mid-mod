require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'validations' do
    it { should have_many :ride_mechanics }
    it { should have_many(:rides).through(:ride_mechanics) }
    it { should validate_presence_of :name }
    it { should validate_presence_of :years_experience }
  end

  describe 'methods' do
    it 'can find the average years of experience of all mechanics' do
      Mechanic.create(name: "Trevor Suter", years_experience: 2)
      Mechanic.create(name: "Jack Berry", years_experience: 4)
      
      expect(Mechanic.average_experience).to eq(3)
    end

    it 'can order rides by thrill rating' do
      trevor = Mechanic.create(name: "Trevor Suter", years_experience: 2)
      ride1 = Ride.create!(name: "Roller Coaster", thrill_rating: 2)
      ride2 = Ride.create!(name: "Tea Cups", thrill_rating: 7)
      RideMechanic.create(ride: ride1, mechanic: trevor)
      RideMechanic.create(ride: ride2, mechanic: trevor)
      
      expect(trevor.rides_by_thrill_rating).to eq([ride2, ride1])
      expect(trevor.rides_by_thrill_rating).to_not eq([ride1, ride2])
    end
  end
end