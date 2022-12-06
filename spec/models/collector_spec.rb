require 'rails_helper'

RSpec.describe Collector, type: :model do 
  it {should have_many :puzzles}

  describe 'puzzle_count' do 
    it 'totals the number of puzzles associated with this collector' do 
      charlie = Collector.create!(name: "Charlie Moore", skills_rating: 5, under_30_yrs: false)
      starwars = charlie.puzzles.create!(name: "Star Wars", pieces_count: 1000, put_together: false)
      rainbowcookies = charlie.puzzles.create!(name: "Rainbow Cookies", pieces_count: 300, put_together: true)

      nicole = Collector.create!(name: "Nicole Wofford", skills_rating: 10, under_30_yrs: true)
      lake_puzzle = nicole.puzzles.create!(name: "Hintersee Lake", pieces_count: 1000, put_together: true)
      dogs_puzzle = nicole.puzzles.create!(name: "Hot Dogs A-Z", pieces_count: 1000, put_together: true)
      cats = nicole.puzzles.create!(name: "Cats in Pajamas", pieces_count: 750, put_together: true)

      expect(nicole.puzzle_count).to eq(3)
      expect(charlie.puzzle_count).to eq(2)
    end 
  end 

  describe 'sort_alpha' do 
    it 'will sort the puzzles alphabetically by name' do 
      nicole = Collector.create!(name: "Nicole Wofford", skills_rating: 10, under_30_yrs: true)
      lake_puzzle = nicole.puzzles.create!(name: "Hintersee Lake", pieces_count: 1000, put_together: true)
      dogs_puzzle = nicole.puzzles.create!(name: "Hot Dogs A-Z", pieces_count: 1000, put_together: true)
      cats = nicole.puzzles.create!(name: "Cats in Pajamas", pieces_count: 750, put_together: true)

      expect(nicole.sort_alpha).to eq([cats, lake_puzzle, dogs_puzzle])
    end
  end

  describe 'pieces_greater_than' do 
    it 'will display the puzzles with pieces count greater than the number entered' do 
      nicole = Collector.create!(name: "Nicole Wofford", skills_rating: 10, under_30_yrs: true)
      lake_puzzle = nicole.puzzles.create!(name: "Hintersee Lake", pieces_count: 1000, put_together: true)
      dogs_puzzle = nicole.puzzles.create!(name: "Hot Dogs A-Z", pieces_count: 1000, put_together: true)
      cats = nicole.puzzles.create!(name: "Cats in Pajamas", pieces_count: 750, put_together: true)

      expect(nicole.pieces_greater_than(800)).to eq([lake_puzzle, dogs_puzzle])
    end 
  end 
end 