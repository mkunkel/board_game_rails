Fabricator(:games_user) do
  game
  user_id { User.last.id }
end
