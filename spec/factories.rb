FactoryGirl.define do
  factory :entry do
    sequence(:headline) { |n| "Entry Headline #{n}" }
    authorship "Jane Smith and John Doe"
    summary "Entry summary"
    sequence(:url) { |n| "http://example.com/#{n}.html" }
    published_at 1.day.ago

    feed
  end

  factory :feed do
    sequence(:name) { |n| "Feed #{n}" }
    sequence(:url) { |n| "http://example.com/feed#{n}.rss" }
    user
  end

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:name) { |n| "user #{n}" }
    password_digest "password"
  end
end
