Fabricator(:play) do
  game
  after_create { Fabricate(:players_play) }
end
