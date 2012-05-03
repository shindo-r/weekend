Then /^debugger$/ do
  save_and_open_page
  debugger
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^(?:|binding )pry$/ do
  binding.pry
end

