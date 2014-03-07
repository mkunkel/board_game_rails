Given(/^a set of (\d+) plays$/) do |num|
  num.to_i.times do
    Fabricate(:play)
  end
end

Given(/^a set of (\d+) players$/) do |num|
  num.to_i.times do
    Fabricate(:player)
  end
end

Given(/^a set of (\d+) games$/) do |num|
  num.to_i.times do
    Fabricate(:game)
  end
end

Given(/^a set of (\d+) games in collection$/) do |num|
  num.to_i.times do |i|
    game = Fabricate(:game, name: "game#{i+1}")
    Fabricate(:games_user, game: game)
  end
end

Then(/^I should see (\d+) plays$/) do |num|
  page.should have_css(".game-play", count: num)
end

Then(/^"(.*?)" should be the same Game$/) do |arg1|
  user_game = User.last.games.where(name: arg1).last.id
  game = Game.where(name: arg1).last.id
  expect(user_game).to eq(game)
end

Then(/^I should see "(.*?)" results$/) do |arg1|
  page.should have_css("tr.result", count: arg1)
end

When(/^I search for "(.*?)"$/) do |arg1|
  steps %{
    Then I click "Add Game"
    And I fill in "#{arg1}" for "Search by Name"
    And I press "Submit"
  }
end

Given(/^"(.*?)" has played "(.*?)"$/) do |player_name, game_name|
  player = Player.find_or_create_by(name: player_name)
  player.plays << Play.create(game_id: Game.where(name: game_name).first.id)
end
