require 'rails_helper'

RSpec.describe "Collectors songs index" do 
  it 'shows all the names of the puzzles for the collector' do 
    nicole = Collector.create!(name: "Nicole Wofford", skills_rating: 10, under_30_yrs: true)
    lake_puzzle = nicole.puzzles.create!(name: "Hintersee Lake", pieces_count: 1000, put_together: true)
    dogs_puzzle = nicole.puzzles.create!(name: "Hot Dogs A-Z", pieces_count: 1000, put_together: true)
    charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
    starwars = charlie.puzzles.create!(name: "Star Wars", pieces_count: 1000, put_together: true)

    visit "/collectors/#{nicole.id}/puzzles"
   
    expect(page).to have_content(lake_puzzle.name)
    expect(page).to have_content(dogs_puzzle.name)
    expect(page).to_not have_content(starwars.name)
  end 

  it 'shows the attributes of each puzzle of the collector' do 
    nicole = Collector.create!(name: "Nicole Wofford", skills_rating: 10, under_30_yrs: true)
    lake_puzzle = nicole.puzzles.create!(name: "Hintersee Lake", pieces_count: 1000, put_together: true)
    dogs_puzzle = nicole.puzzles.create!(name: "Hot Dogs A-Z", pieces_count: 1000, put_together: true)
    charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
    starwars = charlie.puzzles.create!(name: "Star Wars", pieces_count: 1000, put_together: true)

    visit "/collectors/#{nicole.id}/puzzles"
   
    expect(page).to have_content("Pieces Count: #{lake_puzzle.pieces_count}")
    expect(page).to have_content("Put Together: #{lake_puzzle.put_together}")
    expect(page).to have_content("Pieces Count: #{dogs_puzzle.pieces_count}")
    expect(page).to have_content("Put Together: #{dogs_puzzle.put_together}")
    expect(page).to_not have_content(starwars.name)
  end
end 