require 'rails_helper'

RSpec.describe "collectors index page" do 
  it 'displays all the collectors with their name' do 
    collector_1 = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
    collector_2 = Collector.create!(name: "Leslie Grant", skills_rating: 8, under_30_yrs: true)

    visit '/collectors'

    expect(page).to have_content(collector_1.name)
    expect(page).to have_content(collector_2.name)
  end 

  it 'collectors are ordered by most recently created first' do 
    collector_1 = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
    collector_2 = Collector.create!(name: "Leslie Grant", skills_rating: 8, under_30_yrs: true)
    collector_3 = Collector.create!(name: "Nicole Wofford", skills_rating: 10, under_30_yrs: true)
   
    visit '/collectors'

    expect(collector_3.name).to appear_before(collector_2.name)
    expect(collector_2.name).to appear_before(collector_1.name)
  end 

  it 'shows when the collector was created next to each collector' do 
    collector_1 = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
    collector_2 = Collector.create!(name: "Leslie Grant", skills_rating: 8, under_30_yrs: true)
    collector_3 = Collector.create!(name: "Nicole Wofford", skills_rating: 10, under_30_yrs: true)
   
    visit '/collectors'

    expect(page).to have_content("Created: #{collector_1.created_at}")
    expect(page).to have_content("Created: #{collector_2.created_at}")
    expect(page).to have_content("Created: #{collector_3.created_at}")
  end 

  describe 'When I visit any page on the site' do 
    it 'shows a return to collector index link at the top of the page' do 
      charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
      starwars = Puzzle.create!(name: "Star Wars", pieces_count: 1000, put_together: true, collector: charlie)
      rainbowcookies = Puzzle.create!(name: "Rainbow Cookies", pieces_count: 300, put_together: true, collector: charlie)
  
      visit '/puzzles'
      expect(page).to have_link("Go to Collectors Index")

      visit '/collectors'
      expect(page).to have_link("Go to Collectors Index")

      visit "/puzzles/#{starwars.id}"
      expect(page).to have_link("Go to Collectors Index")

      visit "/collectors/#{charlie.id}"
      expect(page).to have_link("Go to Collectors Index")

      visit "/collectors/#{charlie.id}/puzzles"
      expect(page).to have_link("Go to Collectors Index")
    end 

    it 'that routes to the collectors index page' do 
      charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
      starwars = Puzzle.create!(name: "Star Wars", pieces_count: 1000, put_together: true, collector: charlie)
      rainbowcookies = Puzzle.create!(name: "Rainbow Cookies", pieces_count: 300, put_together: true, collector: charlie)
 
      visit '/puzzles'
      click_link "Go to Collectors Index"
      expect(current_path).to eq('/collectors')

      visit '/collectors'
      click_link "Go to Collectors Index"
      expect(current_path).to eq('/collectors')

      visit "/puzzles/#{starwars.id}"
      click_link "Go to Collectors Index"
      expect(current_path).to eq('/collectors')

      visit "/collectors/#{charlie.id}"
      click_link "Go to Collectors Index"
      expect(current_path).to eq('/collectors')

      visit "/collectors/#{charlie.id}/puzzles"
      click_link "Go to Collectors Index"
      expect(current_path).to eq('/collectors')
    end  
  end 
end 