Fabricator(:play) do
  game_id{ sequence(:game_id) { |i| i } }
  after_create{Fabricate(:players_play) }
end