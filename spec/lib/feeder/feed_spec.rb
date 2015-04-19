require "spec_helper"

describe Feeder::Feed do
  describe "#new" do
    it "sets a url" do
      feed = Feeder::Feed.new(url: fake_feed_url)

      expect(feed.url).to eq(fake_feed_url)
    end
  end

  describe "#parse" do
    it "builds entries" do
      stub_feed
      feed = Feeder::Feed.new(url: fake_feed_url)

      feed.fetch

      expect(
        a_request(:get, URI(fake_feed_url))
      ).to have_been_made.at_least_once

      expect(feed.entries.size).to eq(6)
    end
  end

  def stub_feed
    stub_request(:get, URI(fake_feed_url)).
      with(
        headers: {
          "Accept" => "*/*",
        }
      ).to_return(
        status: 200,
        body: feed_contents
      )
  end

  def fake_feed_url
    "http://wallscorp.us/atom2.xml"
  end

  def feed_contents
    fixture_path = File.expand_path(
      "../../../support/fixtures/feed.rss",
      __FILE__
    )

    File.read(fixture_path)
  end
end
