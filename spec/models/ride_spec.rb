require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'validations' do
    it { should have_many :ride_mechanics }
    it { should have_many(:mechanics).through(:ride_mechanics) }
    it { should validate_presence_of :name }
    it { should validate_presence_of :thrill_rating }
    it { should validate_presence_of :open }
  end
end