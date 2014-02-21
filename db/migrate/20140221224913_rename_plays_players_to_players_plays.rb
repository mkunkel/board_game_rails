class RenamePlaysPlayersToPlayersPlays < ActiveRecord::Migration
  def change
    rename_table :plays_players, :players_plays
  end
end
