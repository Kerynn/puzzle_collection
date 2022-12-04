require 'rails_helper'

RSpec.describe 'destroy a collector' do 
  describe 'when I visit the collector show page' do 
    it 'i see a link to delete the collector' do 
      bob = Collector.create!(name: "Bob Bobbins", skills_rating: 2, under_30_yrs: false)

      visit "/collectors/#{bob.id}"
      expect(page).to have_link("Delete Collector")
    end 

    it 'deletes the collector and returns to the collector index page' do 
      bob = Collector.create!(name: "Bob Bobbins", skills_rating: 2, under_30_yrs: false)
      lamps = bob.puzzles.create!(name: "Lamps of the World", pieces_count: 250, put_together: true)
      fields = bob.puzzles.create!(name: "Fields of Gold", pieces_count: 300, put_together: false)

      visit "/collectors"

      expect(page).to have_content(bob.name)

      visit "/collectors/#{bob.id}"
      click_link "Delete Collector"
      
      expect(current_path).to eq("/collectors")
      expect(page).to_not have_content(bob.name)
    end 
  end 
end 