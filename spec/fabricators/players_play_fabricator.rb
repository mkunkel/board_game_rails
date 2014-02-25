Fabricator(:players_play) do
  play_id{ sequence(:play_id) { |i| i } }
  player_id{ sequence(:player_id) { |i| i } }
end