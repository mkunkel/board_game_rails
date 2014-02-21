Fabricator(:player) do
  name{ sequence(:username) { |i| "John Doe#{i}" } }
end