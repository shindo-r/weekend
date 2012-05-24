Given /^"([^"]*)" send following json:$/ do |api, string|
  FakeWeb.register_uri(:get, api, :body => string)
end

When /^"([^"]*)" task runs$/ do |arg1|
  Event.send(arg1)
end

