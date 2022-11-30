require 'rails_helper'

RSpec.describe "puzzles index page" do 

  it 'displays the puzzle page with all the puzzles and their attributes' do 
  collector = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
  starwars = collector.puzzles.create!(name: "Star Wars", pieces_count: 1000, put_together: true)
  rainbowcookies = collector.puzzles.create!(name: "Rainbow Cookies", pieces_count: 300, put_together: true)
   
  visit '/puzzles'

  expect(page).to have_content(starwars.name)
  expect(page).to have_content(starwars.pieces_count)
  expect(page).to have_content(starwars.put_together)
  expect(page).to have_content(rainbowcookies.name)
  expect(page).to have_content(rainbowcookies.pieces_count)
  expect(page).to have_content(rainbowcookies.put_together)
  end 
end 