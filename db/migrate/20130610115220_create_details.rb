class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.text :player
      t.integer :sticks
      t.integer :take
      t.integer :game_id

      t.timestamps
    end
  end
end
