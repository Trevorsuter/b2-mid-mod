require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'validations' do
    it {should have_many :park_rides}
    it {should have_many(:rides).through(:park_rides)}
    it {should validate_presence_of :name}
    it {should validate_presence_of :admissions}
  end
end