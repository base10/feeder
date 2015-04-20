require "spec_helper"
require "fileutils"

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

  describe "#report_file" do
    it "provides a date-keyed file name" do
      Timecop.freeze Date.new(2015, 4, 20) do
        feed = Feeder::Feed.new(url: fake_feed_url)

        expect(feed.report_file).to include("2015-04-20-feed-entries.md")
      end
    end
  end

  describe "#report" do
    before(:each) do
      if FileTest.exist?(report_file)
        FileUtils.remove(report_file)
      end
    end

    it "writes a Markdown document of feed entries" do
      stub_feed
      feed = Feeder::Feed.new(url: fake_feed_url)
      allow(feed).to receive(:report_file).and_return(report_file)

      feed.fetch
      feed.report

      expect(FileTest.exist?(report_file)).to be true
      # expect the file to be valid Markdown
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

  def report_file
    File.expand_path(
      "../../../tmp/feed-report.md",
      __FILE__
    )
  end
end
