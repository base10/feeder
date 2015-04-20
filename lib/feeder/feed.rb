module Feeder; end

class Feeder::Feed
  require "faraday"
  require "feedjira"

  attr_accessor :entries, :parsed_feed, :url

  def initialize(url:)
    @entries = Array.new
    @url = url
  end

  def fetch
    @parsed_feed = parse_feed(request_feed)
    @entries = parsed_feed.entries
  end

  private

  def request_feed
    connection = Faraday.new(url: url) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    response = connection.get
    response.body
  end

  def parse_feed(raw_feed)
    ::Feedjira::Feed.parse(raw_feed)
  end
end
