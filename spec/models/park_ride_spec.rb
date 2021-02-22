require 'rails_helper'

RSpec.describe ParkRide, type: :model do
  describe 'validations' do
    it {should belong_to :park}
    it {should belong_to :ride}
    it {should validate_presence_of :park}
    it {should validate_presence_of :ride}
  end
end