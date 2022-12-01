class CreatePuzzles < ActiveRecord::Migration[5.2]
  def change
    create_table :puzzles do |t|
      t.string :name
      t.integer :pieces_count
      t.boolean :put_together
      t.timestamps
    end
  end
end
