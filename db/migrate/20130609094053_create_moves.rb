class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.text :player
      t.integer :all
      t.integer :take
      t.integer :moves

      t.timestamps
    end
  end
end
