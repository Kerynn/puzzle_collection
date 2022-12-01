require 'rails_helper'

RSpec.describe "collectors index page" do 
  it 'displays all the collectors with their name' do 
    collector_1 = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
    collector_2 = Collector.create!(name: "Leslie Grant", skills_rating: 8, under_30_yrs: true)

    visit '/collectors'

    expect(page).to have_content(collector_1.name)
    expect(page).to have_content(collector_2.name)
  end 



end 