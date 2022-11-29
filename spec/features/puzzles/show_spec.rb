require 'rails_helper'

RSpec.describe 'the puzzles show page' do 

# As a visitor INDEX
# When I visit '/puzzles'
# Then I see each puzzle name including pieces_count and put_togehter

# As a visitor INDEX
# When I visit '/collectors/:collector_id/puzzles'
# Then I see each puzzle that is associated with that Collector with each puzzle's attributes
# (data from each column that is on the child table)

# As a visitor SHOW
# When I visit '/collectors/:id'
# Then I see the Collector name with that id including the skills rating and if under 30

  it 'displays the puzzle by id' do 
    collector = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
    starwars = collector.puzzles.create!(name: "Star Wars", pieces_count: 1000, put_together: true)
    rainbowcookies = collector.puzzles.create!(name: "Rainbow Cookies", pieces_count: 300, put_together: true)
   
    visit "/puzzles/#{starwars.id}"

    expect(page).to have_content(starwars.name)
    expect(page).to have_content(starwars.pieces_count)
    expect(page).to have_content(starwars.put_together)
    expect(page).to_not have_content(rainbowcookies.name)
  end 


end 