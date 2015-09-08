module FeedAssistant
  def stub_feed_request(feed:)
    stub_request(:get, feed.url).to_return(
      body: feed_fixture,
      status: 200,
    )
  end

  def feed_fixture
    File.read(fixture_file_path)
  end

  def fixture_file_path
    "#{Rails.root}/spec/support/fixtures/feed.rss"
  end
end

RSpec.configure do |config|
  config.include FeedAssistant
end
