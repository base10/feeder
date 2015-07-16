require "rails_helper"

describe FeedFetcher do
  it "retrieves each feed" do
    feeds = [
      feed_spy(name: "Feed 1"),
      feed_spy(name: "Feed 2")
    ]

    allow(Feed).to receive(:all).and_return(feeds)
    fetcher = FeedFetcher.new

    fetcher.fetch_all

    feeds.each do |feed|
      expect(feed).to have_received(:fetch)
    end
  end

  def feed_spy(name:)
    instance_spy(Feed, name: name)
  end
end
