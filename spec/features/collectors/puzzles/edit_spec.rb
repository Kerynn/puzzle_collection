require 'rails_helper'

RSpec.describe 'update a collectors puzzle' do 
  describe 'when I visit the collector puzzle index page' do
    it 'links to the edit page to edit the puzzle attributes' do
      charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
      starwars = Puzzle.create!(name: "Star Wars", pieces_count: 1000, put_together: true, collector: charlie)
      rainbowcookies = Puzzle.create!(name: "Rainbow Cookies", pieces_count: 300, put_together: true, collector: charlie)
        
      visit "/collectors/#{charlie.id}/puzzles"
      expect(page).to have_link("Update #{starwars.name}")
      expect(page).to have_link("Update #{rainbowcookies.name}")

      click_link "Update #{starwars.name}"

      expect(current_path).to eq("/puzzles/#{starwars.id}/edit")
    end 

    it 'can update the puzzle information' do 
      charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
      starwars = Puzzle.create!(name: "Spaceballs", pieces_count: 800, put_together: true, collector: charlie)
      rainbowcookies = Puzzle.create!(name: "Rainbow Cookies", pieces_count: 300, put_together: true, collector: charlie)

      visit "/collectors/#{charlie.id}/puzzles"
      expect(page).to have_content('Spaceballs')
      expect(page).to have_content("Pieces Count: 800")

      click_link "Update #{starwars.name}"
      visit "/puzzles/#{starwars.id}/edit"
      fill_in('Name', with: "Star Wars")
      fill_in('Pieces Count', with: 1000)
      check("Put Together")
      click_button 'Update Puzzle'

      expect(current_path).to eq("/puzzles/#{starwars.id}")
      expect(page).to have_content("Star Wars")
      expect(page).to have_content("Pieces Count: 1000")
      expect(page).to have_content("Put Together: true")
    end
  end
end 