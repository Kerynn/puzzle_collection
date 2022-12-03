require 'rails_helper'

RSpec.describe "Collectors puzzles index" do 
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

  it 'has a link to sort all of the puzzles of the collector in alphabetical order' do
    nicole = Collector.create!(name: "Nicole Wofford", skills_rating: 10, under_30_yrs: true)
    lake_puzzle = nicole.puzzles.create!(name: "Hintersee Lake", pieces_count: 1000, put_together: true)
    dogs_puzzle = nicole.puzzles.create!(name: "Dogs A-Z", pieces_count: 1000, put_together: true)
    charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
    starwars = charlie.puzzles.create!(name: "Star Wars", pieces_count: 1000, put_together: true)

    visit "/collectors/#{nicole.id}/puzzles"
    expect(page).to have_link("Sort Puzzles Alphabetically")
  end 

  it 'will sort all of the puzzles of the collector alphabetically and stay on the Collector Puzzle index page' do 
    nicole = Collector.create!(name: "Nicole Wofford", skills_rating: 10, under_30_yrs: true)
    lake_puzzle = nicole.puzzles.create!(name: "Hintersee Lake", pieces_count: 1000, put_together: true)
    dogs_puzzle = nicole.puzzles.create!(name: "Dogs A-Z", pieces_count: 1000, put_together: true)
    starwars = nicole.puzzles.create!(name: "Star Wars", pieces_count: 1000, put_together: true)

    visit "/collectors/#{nicole.id}/puzzles"

    expect(lake_puzzle.name).to appear_before(dogs_puzzle.name)

    click_link "Sort Puzzles Alphabetically"

    expect(current_path).to eq("/collectors/#{nicole.id}/puzzles")

    expect(dogs_puzzle.name).to appear_before(lake_puzzle.name)
    expect(lake_puzzle.name).to appear_before(starwars.name)
  end 
end 