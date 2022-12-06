require 'rails_helper'

RSpec.describe 'creating a new Collector Record' do 
  it 'links to the new page from the collector index' do 
    visit '/collectors'

    click_link('New Collector')

    expect(current_path).to eq('/collectors/new')
  end 

  it 'can create a new collector with its attributes' do 
    visit '/collectors/new'

    fill_in('Name', with: 'Veronica Smith')
    fill_in('Skills rating', with: 6)
    check("Under 30 yrs")
    click_button('Create Collector')

    veronica = Collector.last
    expect(current_path).to eq('/collectors')
    expect(page).to have_content(veronica.name)
    expect(page).to have_content("Skills Rating: #{veronica.skills_rating}")
    expect(page).to have_content("Under 30 years old: #{veronica.under_30_yrs}")
  end 
end 