class CreateCollectors < ActiveRecord::Migration[5.2]
  def change
    create_table :collectors do |t|
      t.string :name
      t.integer :skills_rating
      t.boolean :under_30_yrs
      t.timestamps
    end
  end
end
