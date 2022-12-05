require 'rails_helper'

RSpec.describe 'destroy a collector' do 
  describe 'when I visit the collector show page' do 
    it 'shows a link to delete the collector' do 
      bob = Collector.create!(name: "Bob Bobbins", skills_rating: 2, under_30_yrs: false)

      visit "/collectors/#{bob.id}"
      expect(page).to have_button("Delete Collector")
    end 

    it 'deletes the collector and returns to the collector index page' do 
      bob = Collector.create!(name: "Bob Bobbins", skills_rating: 2, under_30_yrs: false)
      lamps = bob.puzzles.create!(name: "Lamps of the World", pieces_count: 250, put_together: true)
      fields = bob.puzzles.create!(name: "Fields of Gold", pieces_count: 300, put_together: false)

      visit "/collectors"

      expect(page).to have_content(bob.name)

      visit "/collectors/#{bob.id}"
      click_button "Delete Collector"
      
      expect(current_path).to eq("/collectors")
      expect(page).to_not have_content(bob.name)
    end 
  end 

  describe 'when I visit the collector index page' do 
    it 'shows a link next to every collector to delete the collector' do 
      bob = Collector.create!(name: "Bob Bobbins", skills_rating: 2, under_30_yrs: false)
      ozzie = Collector.create!(name: "Ozzie Pawzie", skills_rating: 8, under_30_yrs: true)
      kamee = Collector.create!(name: "Kamee Cabela", skills_rating: 10, under_30_yrs: true)

      visit "/collectors"

      expect(page).to have_button("Delete #{bob.name}")
      expect(page).to have_button("Delete #{ozzie.name}")
      expect(page).to have_button("Delete #{kamee.name}")
    end 

    it 'deletes the collector and no longer displayed on the collector index page' do 
      bob = Collector.create!(name: "Bob Bobbins", skills_rating: 2, under_30_yrs: false)
      ozzie = Collector.create!(name: "Ozzie Pawzie", skills_rating: 8, under_30_yrs: true)
      kamee = Collector.create!(name: "Kamee Cabela", skills_rating: 10, under_30_yrs: true)

      visit "/collectors"

      expect(page).to have_content(bob.name)
      expect(page).to have_content(ozzie.name)
      expect(page).to have_content(kamee.name)

      click_button "Delete #{bob.name}"
      click_button "Delete #{ozzie.name}"
      
      expect(current_path).to eq("/collectors")
      expect(page).to_not have_content(bob.name)
      expect(page).to_not have_content(ozzie.name)
      expect(page).to have_content(kamee.name)
    end 
  end 
end 