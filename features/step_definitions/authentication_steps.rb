When /^I visit the user authentication page$/ do
  visit "/login"
end

When /^I enter the (.*) "(.*)"$/ do |field, value|
  steps %Q{
    When I fill in "user_#{field}" with "#{value}"
  }
end

When(/^I press the "([^"]*)" button$/) do |key|
  steps %Q{
    When I press "#{I18n.t(key)}"
  }
end
