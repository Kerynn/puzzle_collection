require 'rails_helper'

RSpec.describe "puzzles index page" do 

  it 'displays the puzzle page with all the puzzles and their attributes' do 
  charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
  starwars = Puzzle.create!(name: "Star Wars", pieces_count: 1000, put_together: true, collector: charlie)
  rainbowcookies = Puzzle.create!(name: "Rainbow Cookies", pieces_count: 300, put_together: true, collector: charlie)
   
  visit '/puzzles'

  expect(page).to have_content(starwars.name)
  expect(page).to have_content("Pieces Count: #{starwars.pieces_count}")
  expect(page).to have_content("Put Together: #{starwars.put_together}")
  expect(page).to have_content(rainbowcookies.name)
  expect(page).to have_content("Pieces Count: #{rainbowcookies.pieces_count}")
  expect(page).to have_content("Put Together: #{rainbowcookies.put_together}")
  end 
end 