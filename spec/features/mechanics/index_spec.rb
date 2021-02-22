require 'rails_helper'

RSpec.describe 'When I visit a mechanics index page', type: :feature do

  scenario "I see a header saying 'All Mechanics'" do
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
  end

  scenario "I see a list of all mechanics and their attributes" do
    trevor = Mechanic.create(name: "Trevor Suter", years_experience: 2)

    visit '/mechanics'

    within(".mechanic-#{trevor.id}") do
      expect(page).to have_content("#{trevor.name}")
      expect(page).to have_content("#{trevor.years_experience}")
    end
  end
end