require_relative('../../../lib/cucumber-repeat.rb')

Given(/^I do something$/) do
  $i += 1
end

Then(/^I expect it this to pass on the first go$/) do
  if ($i < 1) then
    raise "error"
  end
  $i = 0
end

Then(/^I expect it this to pass on the second go$/) do
  if ($i < 2) then
    raise "error"
  end
  $i = 0
end

Then(/^I expect it this to pass on the third go$/) do
  if ($i < 3) then
    raise "error"
  end
  $i = 0
end

Before do
  $i = 0;
end
