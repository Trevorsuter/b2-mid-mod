require 'rails_helper'

RSpec.describe "When I visit a Mechanics show page", type: :feature do
  before :each do
    @trevor = Mechanic.create(name: "Trevor Suter", years_experience: 2)
    @ride1 = Ride.create!(name: "Roller Coaster", thrill_rating: 2)
    @ride2 = Ride.create!(name: "Tea Cups", thrill_rating: 7)
    @ride3 = Ride.create!(name: "Basketball", thrill_rating: 10, open: false)
    @ride4 = Ride.create!(name: "Lazy River", thrill_rating: 1)
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
  # When I fill in that field with an id of an existing ride and hit submit
  # I’m taken back to that mechanic's show page
  # And I see the name of that newly added ride on this mechanics show page
  scenario 'I see a form to add a ride to their workload' do
    visit "/mechanics/#{@trevor.id}"

    within(".new-ride") do
      expect(page).to have_field("add_ride")
      expect(page).to have_button("submit")
    end
  end

  scenario 'I can add a new ride to the mechanics workload' do
    visit "/mechanics/#{@trevor.id}"

    fill_in "add_ride", with: "#{@ride4.id}"
    click_button("submit")

    expect(current_path).to eq("/mechanics/#{@trevor.id}")
    within(".rides") do
      expect(page).to have_content(@ride1.name)
      expect(page).to have_content(@ride2.name)
      expect(page).to_not have_content(@ride3.name)
      expect(page).to have_content(@ride4.name)
    end
  end
end