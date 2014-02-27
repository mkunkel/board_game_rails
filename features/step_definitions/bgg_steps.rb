When(/^BoardGameGeek is searched for "(.*?)"$/) do |arg1|
  bgg = BggApi.new
  @response = bgg.search({query: arg1, type: 'boardgame'})
end

Then(/^it should return (\d+) results$/) do |arg1|
  expect(@response["total"].to_i).to eq(5)
end
