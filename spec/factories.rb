FactoryGirl.define do
  trait :first_or_new_feed do
    before :create do |model|
      if !model.feed.present?
        model.feed = Feed.first || create(:feed)
      end
    end
  end

  trait :first_or_new_user do
    before :create do |model|
      if !model.user.present?
        model.user = User.first || create(:user)
      end
    end
  end

  factory :entry do
    sequence(:headline) { |n| "Entry Headline #{n}" }
    authorship "Jane Smith and John Doe"
    summary "Entry summary"
    sequence(:url) { |n| "http://example.com/#{n}.html" }
    published_at 1.day.ago

    first_or_new_feed
  end

  factory :feed do
    sequence(:name) { |n| "Feed #{n}" }
    sequence(:url) { |n| "http://example.com/feed#{n}.rss" }

    first_or_new_user
  end

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:name) { |n| "user #{n}" }
    password_digest "password"
  end
end
