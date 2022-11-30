require 'rails_helper'

RSpec.describe 'collectors show page' do 
  describe 'As a visitor' do
    describe 'When I visit collector show page by id' do
      it 'shows the collector with that id including the name, skills level, and if under 30yrs' do 
        collector_1 = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
        collector_2 = Collector.create!(name: "Leslie Grant", skills_rating: 8, under_30_yrs: true)

        visit "/collectors/#{collector_1.id}"

        expect(page).to have_content(collector_1.name)
        expect(page).to_not have_content(collector_2.name)
        expect(page).to have_content("Skills Rating: 5")
        expect(page).to have_content("Under 30 Years Old: false")
      end 
    end 
  end 



end 