class Collector < ApplicationRecord 
  has_many :puzzles

  def puzzle_count
    puzzles.count
  end 

  def sort_alpha
    puzzles.order(:name)
  end 

  def pieces_greater_than(input_pieces)
    puzzles.where("pieces_count > #{input_pieces}")
  end 
  
  def self.sort_collector
    order(created_at: :desc)
  end

  def self.sort_by_puzzles
    joins(:puzzles).group(:id).order('COUNT(puzzles.id) DESC')
  end
end 