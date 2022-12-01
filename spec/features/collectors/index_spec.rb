require 'rails_helper'

RSpec.describe "collectors index page" do 
  it 'displays all the collectors with their name' do 
    collector_1 = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
    collector_2 = Collector.create!(name: "Leslie Grant", skills_rating: 8, under_30_yrs: true)

    visit '/collectors'

    expect(page).to have_content(collector_1.name)
    expect(page).to have_content(collector_2.name)
  end 

  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created

  it 'collectors are ordered by most recently created first' do 
    collector_1 = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
    sleep(1) 
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
end 