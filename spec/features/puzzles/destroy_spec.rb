require 'rails_helper'

RSpec.describe 'destroy a puzzle' do 
  describe 'when I visit the puzzle show page' do 
    it 'shows a link to delete the puzzle' do 
      caleb = Collector.create!(name: "Caleb Faleb", skills_rating: 7, under_30_yrs: false)
      buffalo = caleb.puzzles.create!(name: "Buffalo Roams", pieces_count: 600, put_together: true)

      visit "/puzzles/#{buffalo.id}"
      
      expect(page).to have_link("Delete Puzzle")
    end

    it 'deletes the puzzle and returns to the puzzle index page' do 
      caleb = Collector.create!(name: "Caleb Faleb", skills_rating: 7, under_30_yrs: false)
      buffalo = caleb.puzzles.create!(name: "Buffalo Roams", pieces_count: 600, put_together: true)

      visit "/puzzles"
      expect(page).to have_content(buffalo.name)

      visit "/puzzles/#{buffalo.id}"
      click_link "Delete Puzzle"

      expect(current_path).to eq("/puzzles")
      expect(page).to_not have_content(buffalo.name)
    end 
  end 
end 