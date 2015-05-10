FactoryGirl.define do
  factory :feed do
    name "Site with a feed"
    url "http://example.com/feed.rss"
    user
  end

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:name) { |n| "user #{n}" }
    password_digest "password"
  end
end
