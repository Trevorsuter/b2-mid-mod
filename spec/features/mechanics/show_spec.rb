require 'rails_helper'

RSpec.describe "When I visit a Mechanics show page", type: :feature do
  before :each do
    @trevor = Mechanic.create(name: "Trevor Suter", years_experience: 2)
    @ride1 = Ride.create!(name: "Roller Coaster", thrill_rating: 2)
    @ride2 = Ride.create!(name: "Tea Cups", thrill_rating: 7)
    @ride3 = Ride.create!(name: "Basketball", thrill_rating: 10, open: false)
    RideMechanic.create(ride: @ride1, mechanic: @trevor)
    RideMechanic.create(ride: @ride2, mechanic: @trevor)
    RideMechanic.create(ride: @ride3, mechanic: @trevor)
  end
  scenario "I see their attributes and the names of all rides they’re working on that are open" do
    visit "/mechanics/#{@trevor.id}"

    expect(page).to have_content(@trevor.name)
    expect(page).to have_content(@trevor.years_experience)
    
    within(".rides") do
      expect(page).to have_content(@ride1.name)
      expect(page).to have_content(@ride2.name)
      expect(page).to_not have_content(@ride3.name)
    end
  end
end