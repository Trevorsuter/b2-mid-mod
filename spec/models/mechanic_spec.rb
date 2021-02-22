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
  end
end