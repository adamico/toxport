Then /^(\d+) user should exist$/ do |count|
  User.count.should == count.to_i
end
