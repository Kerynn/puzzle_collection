require 'rails_helper'

RSpec.describe 'creating a new puzzle for a collector' do
  it 'links to the new page from the collector puzzle index' do 
    charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
    
    visit "/collectors/#{charlie.id}/puzzles"
    
    click_link('Create Puzzle')

    expect(current_path).to eq("/collectors/#{charlie.id}/puzzles/new")
  end 

  it 'can create a new puzzle with its attributes for the collector' do 
    charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
    
    visit "/collectors/#{charlie.id}/puzzles"
    expect(page).to_not have_content("Log Cabin")

    visit "/collectors/#{charlie.id}/puzzles"
    
    click_link('Create Puzzle')
    fill_in('Name', with: 'Log Cabin')
    fill_in('Pieces Count', with: 500)
    check("Put Together")
    click_button('Create Puzzle')

    cabin = Puzzle.last 
    expect(current_path).to eq("/collectors/#{charlie.id}/puzzles")
    expect(page).to have_content(cabin.name)
    expect(page).to have_content("Pieces Count: #{cabin.pieces_count}")
    expect(page).to have_content("Put Together: #{cabin.put_together}")
  end 
end 
