require 'rails_helper'

RSpec.describe 'the puzzles show page' do 

# As a visitor
# When I visit '/puzzles'
# Then I see each puzzle name including pieces_count and put_togehter

# As a visitor
# When I visit '/puzzles/1' (or id of the puzzle)
# Then I see the puzzle with that id including the pieces_count and put_together

# As a visitor
# When I visit '/collectors/:collector_id/puzzles'
# Then I see each puzzle that is associated with that Collector with each puzzle's attributes
# (data from each column that is on the child table)

  it 'displays the puzzle' do 
    puzzle = Puzzle.create!(name: "Star Wars", pieces_count: 1000, put_together: true)
    visit "/puzzles/#{puzzle.id}"

  end 

  xit 'displays the name of collector of the puzzle' do 


  end 

end 