require 'rails_helper'

RSpec.describe 'collectors show page' do 
  describe 'As a visitor' do
    describe 'When I visit collector show page by id' do
      it 'shows the collector with that id including the name, skills level, and if under 30yrs' do 
        collector_1 = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
        collector_2 = Collector.create!(name: "Leslie Grant", skills_rating: 8, under_30_yrs: true)

        visit "/collectors/#{collector_1.id}"
        save_and_open_page
        
      end 
    end 
  end 



end 