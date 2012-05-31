FactoryGirl.define do
  factory :event do
    title 'title'
    url   'http://example.com/'
    started_at { Date.tomorrow.to_s.to_s.to_time(:local) }
    ended_at { Date.tomorrow.to_s.to_s.to_time(:local) }
    address 'Tokyo'
  end
end
