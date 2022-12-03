require 'rails_helper'

RSpec.describe 'update a puzzle' do
  describe 'when I visit the puzzle show page by id' do
    it 'links to the edit page to edit the puzzle attributes' do
      leslie = Collector.create!(name: "Leslie Grant", skills_rating: 8, under_30_yrs: true)
      puppies = leslie.puzzles.create!(name: "Puppies in a Basket", pieces_count: 1000, put_together: false)

      visit "/puzzles/#{puppies.id}"
      click_link "Update Puzzle"

      expect(current_path).to eq("/puzzles/#{puppies.id}/edit")
    end 

    it 'can update the puzzle information' do 
      leslie = Collector.create!(name: "Leslie Grant", skills_rating: 8, under_30_yrs: true)
      puppies = leslie.puzzles.create!(name: "Puppies in a Drawer", pieces_count: 1000, put_together: false)
     
      visit "/puzzles/#{puppies.id}"
      expect(page).to have_content('Puppies in a Drawer')
      expect(page).to have_content("Put Together: false")

      click_link 'Update Puzzle'
      visit "/puzzles/#{puppies.id}/edit"
      fill_in('Name', with: "Puppies in a Basket")
      fill_in('Pieces Count', with: 1000)
      check("Put Together")
      click_button 'Update Puzzle'

      expect(current_path).to eq("/puzzles/#{puppies.id}")
      expect(page).to have_content("Puppies in a Basket")
      expect(page).to have_content("Pieces Count: 1000")
      expect(page).to have_content("Put Together: true")
    end 
  end 

  describe 'when I visit the puzzle index page' do
    it 'links to the edit page to edit the puzzle attributes' do
      charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
      starwars = Puzzle.create!(name: "Star Wars", pieces_count: 1000, put_together: true, collector: charlie)
      rainbowcookies = Puzzle.create!(name: "Rainbow Cookies", pieces_count: 300, put_together: true, collector: charlie)
      
      visit "/puzzles"
      expect(page).to have_link("Update #{starwars.name}")
      expect(page).to have_link("Update #{rainbowcookies.name}")

      click_link "Update #{starwars.name}"

      expect(current_path).to eq("/puzzles/#{starwars.id}/edit")
    end 

    it 'can update the puzzle information' do 
      charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
      starwars = Puzzle.create!(name: "Spaceballs", pieces_count: 800, put_together: true, collector: charlie)
      rainbowcookies = Puzzle.create!(name: "Rainbow Cookies", pieces_count: 300, put_together: true, collector: charlie)

      visit "/puzzles"
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