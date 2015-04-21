Fabricator(:game) do
  name { sequence(:name) { |i| "game#{i}" } }
  min_players 2
  max_players 5
  playing_time 60
end
