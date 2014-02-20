class CreatePlaysPlayers < ActiveRecord::Migration
  def change
    create_table :plays_players do |t|
      t.integer :play_id
      t.integer :player_id

      t.timestamps
    end
  end
end
