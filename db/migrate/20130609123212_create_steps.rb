class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :player
      t.integer :all
      t.integer :take
      t.integer :Games

      t.timestamps
    end
  end
end
