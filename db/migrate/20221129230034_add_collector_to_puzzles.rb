class AddCollectorToPuzzles < ActiveRecord::Migration[5.2]
  def change
    add_reference :puzzles, :collector, foreign_key: true
  end
end
