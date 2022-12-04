require 'rails_helper'

RSpec.describe 'destroy a puzzle from the collector puzzle index page' do 
  describe 'when I visit the collector puzzle index page' do 
    it 'shows a link next to every puzzle to delete the puzzle' do 
      caleb = Collector.create!(name: "Caleb Faleb", skills_rating: 7, under_30_yrs: false)
      buffalo = caleb.puzzles.create!(name: "Buffalo Roams", pieces_count: 600, put_together: true)
      snow = caleb.puzzles.create!(name: "Snowy Mountains", pieces_count: 800, put_together: true)

      visit "/collectors/#{caleb.id}/puzzles"
      expect(page).to have_link("Delete #{buffalo.name}")
      expect(page).to have_link("Delete #{snow.name}")
    end 

    it 'deletes the puzzle and returns to the puzzle index page' do 
      caleb = Collector.create!(name: "Caleb Faleb", skills_rating: 7, under_30_yrs: false)
      buffalo = caleb.puzzles.create!(name: "Buffalo Roams", pieces_count: 600, put_together: true)
      snow = caleb.puzzles.create!(name: "Snowy Mountains", pieces_count: 800, put_together: true)
      
      visit "/collectors/#{caleb.id}/puzzles"
      
      expect(page).to have_content(buffalo.name)
      expect(page).to have_content(snow.name)

      click_link "Delete #{snow.name}"
    
      expect(current_path).to eq("/puzzles")
      expect(page).to_not have_content(snow.name)
      expect(page).to have_content(buffalo.name)
    end 
  end 
end 