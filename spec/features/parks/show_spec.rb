require 'rails_helper'

RSpec.describe "When I visit a parks show page", type: :feature do
  before :each do
    @ride1 = Ride.create!(name: "Roller Coaster", thrill_rating: 10)
    @ride2 = Ride.create!(name: "Tea Cups", thrill_rating: 7)
    @park1 = Park.create!(name: "Elitch Gardens", admissions: 50.00)
    ParkRide.create!(park: @park1, ride: @ride1)
    ParkRide.create!(park: @park1, ride: @ride2)
  end

  scenario "I see the parks attributes" do
    visit "/parks/#{@park1.id}"

    expect(page).to have_content(@park1.name)
    expect(page).to have_content(@park1.admissions)
  end

  scenario "I see the parks rides" do
    visit "/parks/#{@park1.id}"

    within(".rides") do
      expect(page).to have_content(@ride1.name)
      expect(page).to have_content(@ride2.name)
    end
  end
end