Then(/^I select "(.*?)" from "(.*?)"$/) do |value, field|
  field = "game #{field}"
  field = field.gsub(/[().]/, "").split(" ").join("_").downcase
  select(value, from: field)
end