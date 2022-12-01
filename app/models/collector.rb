class Collector < ApplicationRecord 
  has_many :puzzles

  def puzzle_count
    puzzles.count(:collector_id)
  end 
end 