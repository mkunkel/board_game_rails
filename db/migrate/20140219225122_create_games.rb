class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :min_players
      t.integer :max_players
      t.text :description
      t.integer :playing_time

      t.timestamps
    end
  end
end
