Fabricator(:games_user) do
  game_id{ sequence(:game_id) { |i| i } }
  user_id{ User.last.id }
end