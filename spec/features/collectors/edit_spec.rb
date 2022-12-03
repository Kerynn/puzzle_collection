require 'rails_helper'

RSpec.describe 'update the collector' do 
  describe 'when I visit the collector show page by id' do
    it 'links to the edit page to edit the collector attributes' do 
      collector_1 = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)

      visit "/collectors/#{collector_1.id}"
      click_link 'Update Collector'

      expect(current_path).to eq("/collectors/#{collector_1.id}/edit")
    end 

    it 'can update the collector information' do 
      collector_1 = Collector.create!(name: "Charlie M", skills_rating: 3, under_30_yrs: false)

      visit "/collectors/#{collector_1.id}"
      expect(page).to have_content('Charlie M')
      expect(page).to have_content("Skills Rating: 3")

      click_link 'Update Collector'
      visit "/collectors/#{collector_1.id}/edit"
      fill_in('Name', with: "Charlie Moore")
      fill_in('Skills Rating', with: 5)
      check("Under 30 Years Old")
      click_button 'Update Collector'

      expect(current_path).to eq("/collectors/#{collector_1.id}")
      expect(page).to have_content("Charlie Moore")
      expect(page).to have_content("Skills Rating: 5")
      expect(page).to have_content("Under 30 Years Old: true")
    end 
  end 

  describe 'when I visit the collector index page' do 
    it 'links to the edit page to edit the collector information' do 
      leslie = Collector.create!(name: "Leslie Grant", skills_rating: 8, under_30_yrs: true)

      visit "/collectors"
      click_link "Update #{leslie.name}"

      expect(current_path).to eq("/collectors/#{leslie.id}/edit")
    end
    
    it 'can update the collector information' do 
      leslie = Collector.create!(name: "Lesleeee Grant", skills_rating: 8, under_30_yrs: false)

      visit "/collectors"
      expect(page).to have_content('Lesleeee Grant')

      click_link "Update #{leslie.name}"
      visit "/collectors/#{leslie.id}/edit"
      save_and_open_page
      fill_in('Name', with: "Leslie Grant")
      fill_in('Skills Rating', with: 8)
      check("Under 30 Years Old")
      click_button 'Update Collector'


      expect(current_path).to eq("/collectors/#{leslie.id}")
      expect(page).to have_content("Leslie Grant")
      expect(page).to have_content("Skills Rating: 8")
      expect(page).to have_content("Under 30 Years Old: true")
    end 
  end 
end 