class Collector < ApplicationRecord 
  has_many :puzzles

  def puzzle_count
    puzzles.count
  end 

  def sort_alpha
    puzzles.order(:name)
  end 

  # def pieces_greater_than
  # end 
end 