Then(/^I select "(.*?)" from "(.*?)"$/) do |value, field|
  field = "game #{field}"
  field = field.gsub(/[().]/, "").split(" ").join("_").downcase
  select(value, from: field)
end

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
  num.to_i.times do
    Fabricate(:games_user)
    Fabricate(:game)
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
  page.should have_css("li.result", count: arg1)
end


