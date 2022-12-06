require 'rails_helper'

RSpec.describe 'collectors show page' do 
  describe 'When I visit collector show page by id' do
    it 'shows the collector with that id including the name, skills level, and if under 30yrs' do 
      collector_1 = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
      collector_2 = Collector.create!(name: "Leslie Grant", skills_rating: 8, under_30_yrs: true)

      visit "/collectors/#{collector_1.id}"

      expect(page).to have_content(collector_1.name)
      expect(page).to_not have_content(collector_2.name)
      expect(page).to have_content("Skills Rating: #{collector_1.skills_rating}")
      expect(page).to have_content("Under 30 Years Old: #{collector_1.under_30_yrs}")
    end 

    it 'shows a total count of number of puzzles associated with this collector' do 
      charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
      starwars = charlie.puzzles.create!(name: "Star Wars", pieces_count: 1000, put_together: false)
      rainbowcookies = charlie.puzzles.create!(name: "Rainbow Cookies", pieces_count: 300, put_together: true)

      nicole = Collector.create!(name: "Nicole Wofford", skills_rating: 10, under_30_yrs: true)
      lake_puzzle = nicole.puzzles.create!(name: "Hintersee Lake", pieces_count: 1000, put_together: true)
      dogs_puzzle = nicole.puzzles.create!(name: "Hot Dogs A-Z", pieces_count: 1000, put_together: true)
      cats = nicole.puzzles.create!(name: "Cats in Pajamas", pieces_count: 750, put_together: true)

      visit "/collectors/#{nicole.id}"

      expect(page).to have_content(nicole.name)
      expect(page).to have_content("Total Puzzle Count: #{nicole.puzzle_count}")
      expect(page).to_not have_content("Total Puzzle Count: #{charlie.puzzle_count}")
    end
    
    it 'has a Puzzles of the Collector link' do 
      nicole = Collector.create!(name: "Nicole Wofford", skills_rating: 10, under_30_yrs: true)
      lake_puzzle = nicole.puzzles.create!(name: "Hintersee Lake", pieces_count: 1000, put_together: true)
      dogs_puzzle = nicole.puzzles.create!(name: "Hot Dogs A-Z", pieces_count: 1000, put_together: true)
      cats = nicole.puzzles.create!(name: "Cats in Pajamas", pieces_count: 750, put_together: true)

      charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
      starwars = charlie.puzzles.create!(name: "Star Wars", pieces_count: 1000, put_together: false)
      rainbowcookies = charlie.puzzles.create!(name: "Rainbow Cookies", pieces_count: 300, put_together: true)

      visit "/collectors/#{nicole.id}"
      expect(page).to have_link("Go to the Puzzles of this Collector")

      visit "/collectors/#{charlie.id}"
      expect(page).to have_link("Go to the Puzzles of this Collector")
    end 
    
    it 'routes to that Collectors puzzles index page' do
      nicole = Collector.create!(name: "Nicole Wofford", skills_rating: 10, under_30_yrs: true)
      lake_puzzle = nicole.puzzles.create!(name: "Hintersee Lake", pieces_count: 1000, put_together: true)
      dogs_puzzle = nicole.puzzles.create!(name: "Hot Dogs A-Z", pieces_count: 1000, put_together: true)
      cats = nicole.puzzles.create!(name: "Cats in Pajamas", pieces_count: 750, put_together: true)

      charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
      starwars = charlie.puzzles.create!(name: "Star Wars", pieces_count: 1000, put_together: false)
      rainbowcookies = charlie.puzzles.create!(name: "Rainbow Cookies", pieces_count: 300, put_together: true)

      visit "/collectors/#{nicole.id}"
      click_link "Go to the Puzzles of this Collector"
      expect(current_path).to eq("/collectors/#{nicole.id}/puzzles")
      expect(page).to have_content(lake_puzzle.name)
      expect(page).to have_content(dogs_puzzle.name)
      expect(page).to have_content(cats.name)
      expect(page).to_not have_content(rainbowcookies.name)

      visit "/collectors/#{charlie.id}"
      click_link "Go to the Puzzles of this Collector"
      expect(current_path).to eq("/collectors/#{charlie.id}/puzzles")
      expect(page).to have_content(starwars.name)
      expect(page).to have_content(rainbowcookies.name)
      expect(page).to_not have_content(cats.name)
    end 
  end 
end 