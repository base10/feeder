FactoryGirl.define do
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
