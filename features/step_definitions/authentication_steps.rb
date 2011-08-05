When /^I visit the (.*) authentication page$/ do |resource|
  base_path = (resource == "admin") ? resource : resource.pluralize
  visit "/#{base_path}/sign_in"
end

When /^I enter the (.*) (.*) "(.*)"$/ do |resource, field, value|
  steps %Q{
    When I fill in "#{resource}_#{field}" with "#{value}"
  }
end

When(/^I press the "([^"]*)" button$/) do |key|
  steps %Q{
    When I press "#{I18n.t(key)}"
  }
end

When /^I login as a (.*) with "([^"]*)" and "([^"]*)"$/ do |resource, user, pass|
  steps %Q{
    Given the following #{resource.pluralize} exist:
      |username|password|email              |
      |#{user}  |#{pass}|#{user}@example.com|
    When I visit the #{resource} authentication page
    And I enter the #{resource} username "#{user}"
    And I enter the #{resource} password "#{pass}"
    And I press the "devise.common.sign_in" button
  }
end

When /^I logout$/ do
  visit "/users/sign_out"
end
