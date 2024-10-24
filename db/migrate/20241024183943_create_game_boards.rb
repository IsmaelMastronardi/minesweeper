class CreateGameBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :game_boards do |t|
      t.string :name
      t.integer :width
      t.integer :height
      t.integer :bomb_amount
      t.string :email
      t.jsonb :board

      t.timestamps
    end
  end
end
