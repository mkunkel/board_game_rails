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

Then(/^I should see (\d+) plays$/) do |num|
  page.should have_css(".game-play", count: num)
end
