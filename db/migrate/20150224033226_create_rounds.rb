class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :game_id
      t.string  :player1_selection
      t.string  :player2_selection

      t.timestamps
    end
  end
end
